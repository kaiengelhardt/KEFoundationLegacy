import Foundation

public extension NSPredicate {
	
	public typealias Evaluator = (AnyObject?) -> Bool
	
	public var evaluator: Evaluator {
		return evaluate(with:)
	}
	
}
