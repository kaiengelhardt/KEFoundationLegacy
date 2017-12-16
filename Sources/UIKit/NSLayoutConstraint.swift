import UIKit

public extension NSLayoutConstraint {
	
	public func with(priority: UILayoutPriority) -> NSLayoutConstraint {
		self.priority = priority
		return self
	}
	
}
