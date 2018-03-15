import UIKit

public extension NSLayoutConstraint {
	
	public func with(priority: UILayoutPriority) -> NSLayoutConstraint {
		self.priority = priority
		return self
	}
	
}

public extension Array where Element == NSLayoutConstraint {
	
	public func with(priority: UILayoutPriority) -> [NSLayoutConstraint] {
		for constraint in self {
			constraint.priority = priority
		}
		return self
	}
	
}
