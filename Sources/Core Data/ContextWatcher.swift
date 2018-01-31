import CoreData

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
	
	@objc func managedObjectContextDidSave(notification: Notification) {
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
		if addedObjects.count + updatedObjects.count + deletedObjects.count > 0 {
			delegate?.contextWatcher(self, addedObjects: addedObjects, updatedObjects: updatedObjects, deletedObjects: deletedObjects)
		}
	}
	
}

public protocol ContextWatcherDelegate : AnyObject {
	
	func contextWatcher(_ watcher: ContextWatcher, addedObjects: Set<NSManagedObject>, updatedObjects: Set<NSManagedObject>, deletedObjects: Set<NSManagedObject>)
	
}
