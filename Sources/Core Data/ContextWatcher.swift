//
//  ContextWatcher.swift
//  KEFoundation
//
//  Created by Kai Engelhardt on 30.01.18
//  Copyright © 2018 Kai Engelhardt. All rights reserved.
//
//  Distributed under the permissive MIT license
//  Get the latest version from here:
//
//  https://github.com/kaiengelhardt/KEFoundation
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import CoreData

/// Based on [ZSContextWatcher](https://github.com/mzarra/MSZ_Shared) by Marcus Zarra
public class ContextWatcher {
	
	public weak var delegate: ContextWatcherDelegate?
	
	private let persistentStoreCoordinator: NSPersistentStoreCoordinator
	private var masterPredicate: NSPredicate?
	
	public init(coordinator: NSPersistentStoreCoordinator) {
		self.persistentStoreCoordinator = coordinator
		NotificationCenter.default.addObserver(self, selector: #selector(managedObjectContextDidSave(notification:)), name: Notification.Name.NSManagedObjectContextDidSave, object: nil)
	}
	
	public convenience init?(context: NSManagedObjectContext) {
		guard let coordinator = context.persistentStoreCoordinator else {
			return nil
		}
		self.init(coordinator: coordinator)
	}
	
	public func addEntityToWatch(_ entity: NSEntityDescription, predicate: NSPredicate? = nil) {
		let entityPredicate = NSPredicate(format: "entity.name == %@", entity.name ?? "")
		let finalPredicate: NSPredicate
		if let predicate = predicate {
			finalPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [entityPredicate, predicate])
		} else {
			finalPredicate = entityPredicate
		}
		
		guard let currentMasterPredicate = masterPredicate else {
			masterPredicate = finalPredicate
			return
		}
		masterPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: [finalPredicate, currentMasterPredicate])
	}
	
	@objc
	func managedObjectContextDidSave(notification: Notification) {
		guard
			let context = notification.object as? NSManagedObjectContext,
			persistentStoreCoordinator == context.persistentStoreCoordinator
			else {
				return
		}
		
		var addedObjects = notification.userInfo?[NSInsertedObjectsKey] as? Set<NSManagedObject> ?? []
		var updatedObjects = notification.userInfo?[NSUpdatedObjectsKey] as? Set<NSManagedObject> ?? []
		var deletedObjects = notification.userInfo?[NSDeletedObjectsKey] as? Set<NSManagedObject> ?? []
		if let masterPredicate = masterPredicate {
			addedObjects = addedObjects.filter(masterPredicate.evaluator)
			updatedObjects = updatedObjects.filter(masterPredicate.evaluator)
			deletedObjects = deletedObjects.filter(masterPredicate.evaluator)
		}
		if addedObjects.count + updatedObjects.count + deletedObjects.count > 0 { // swiftlint:disable:this empty_count
			delegate?.contextWatcher(self, addedObjects: addedObjects, updatedObjects: updatedObjects, deletedObjects: deletedObjects)
		}
	}
	
}

public protocol ContextWatcherDelegate: AnyObject {
	
	func contextWatcher(_ watcher: ContextWatcher, addedObjects: Set<NSManagedObject>, updatedObjects: Set<NSManagedObject>, deletedObjects: Set<NSManagedObject>)
	
}
