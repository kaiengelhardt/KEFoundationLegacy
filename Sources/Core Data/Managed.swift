import CoreData

public protocol Managed : AnyObject, NSFetchRequestResult {
	
	static var entityName: String { get }
	
	static var defaultSortDescriptors: [NSSortDescriptor] { get }
	
}

extension NSManagedObject : Managed {}

public extension Managed where Self : NSManagedObject {
	
	public static var entityName: String {
		return entity().name!
	}
	
	public static var defaultSortDescriptors: [NSSortDescriptor] {
		return []
	}
	
	public static var sortedFetchRequest: NSFetchRequest<Self> {
		let request = self.fetchRequest() as! NSFetchRequest<Self>
		request.sortDescriptors = defaultSortDescriptors
		return request
	}
	
	private static func materializedObject(in context: NSManagedObjectContext, matching predicate: NSPredicate) -> Self? {
		for object in context.registeredObjects where !object.isFault {
			guard let result = object as? Self, predicate.evaluate(with: result) else {
				continue
			}
			return result
		}
		return nil
	}
	
	public static func fetch(in context: NSManagedObjectContext, configuration: (NSFetchRequest<Self>) -> () = { _ in }) -> [Self] {
		let request = NSFetchRequest<Self>(entityName: Self.entityName)
		configuration(request)
		return try! context.fetch(request)
	}
	
	public static func findOrFetch(in context: NSManagedObjectContext, matching predicate: NSPredicate) -> Self? {
		if let object = materializedObject(in: context, matching: predicate) {
			return object
		} else {
			return fetch(in: context) { request in
				request.predicate = predicate
				request.returnsObjectsAsFaults = false
				request.fetchLimit = 1
				}.first
		}
	}
	
	public static func findOrCreate(in context: NSManagedObjectContext, matching predicate: NSPredicate, configure: (Self) -> ()) -> Self {
		if let object = findOrFetch(in: context, matching: predicate) {
			return object
		} else {
			let newObject = Self(context: context)
			configure(newObject)
			return newObject
		}
	}
	
	@discardableResult
	public static func updateOrCreate(in context: NSManagedObjectContext, matching predicate: NSPredicate, configure: (Self) -> ()) -> Self {
		if let object = findOrFetch(in: context, matching: predicate) {
			configure(object)
			return object
		} else {
			let newObject = Self(context: context)
			configure(newObject)
			return newObject
		}
	}
	
}
