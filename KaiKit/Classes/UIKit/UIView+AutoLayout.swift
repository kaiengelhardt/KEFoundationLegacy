import UIKit

public struct AutoLayout {
	
	public static let standardVerticalEdgeSpacing = 8
	public static let standardHorizontalEdgeSpacing = 16
	public static let standardSpacing = 8
	
}

public extension UIView {
	
	public func constraintsEqualToEdgesOfSuperview() -> [NSLayoutConstraint] {
		guard let superview = superview else {
			return []
		}
		return [
			leftAnchor.constraint(equalTo: superview.leftAnchor),
			rightAnchor.constraint(equalTo: superview.rightAnchor),
			topAnchor.constraint(equalTo: superview.topAnchor),
			bottomAnchor.constraint(equalTo: superview.bottomAnchor),
		]
	}
	
}

public extension NSLayoutYAxisAnchor {
	
	public func constraintEqualToSystemSpacingBelow(_ anchor: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
		return constraintEqualToSystemSpacingBelow(anchor, multiplier: 1)
	}
	
	public func constraintGreaterThanOrEqualToSystemSpacingBelow(_ anchor: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
		return constraintGreaterThanOrEqualToSystemSpacingBelow(anchor, multiplier: 1)
	}
	
	public func constraintLessThanOrEqualToSystemSpacingBelow(_ anchor: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
		return constraintLessThanOrEqualToSystemSpacingBelow(anchor, multiplier: 1)
	}
	
}

public extension NSLayoutXAxisAnchor {
	
	public func constraintEqualToSystemSpacingAfter(_ anchor: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
		return constraintEqualToSystemSpacingAfter(anchor, multiplier: 1)
	}
	
	public func constraintGreaterThanOrEqualToSystemSpacingAfter(_ anchor: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
		return constraintGreaterThanOrEqualToSystemSpacingAfter(anchor, multiplier: 1)
	}
	
	public func constraintLessThanOrEqualToSystemSpacingAfter(_ anchor: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
		return constraintLessThanOrEqualToSystemSpacingAfter(anchor, multiplier: 1)
	}
	
}
