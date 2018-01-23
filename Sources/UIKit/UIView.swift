import UIKit

public extension UIView {
	
	public func constraintsEqualToEdgesOfSuperview() -> [NSLayoutConstraint] {
		return constraintsEqualToEdgesOf(view: superview)
	}
	
	public func constraintsEqualToEdgesOf(view: UIView?) -> [NSLayoutConstraint] {
		guard let view = view else {
			return []
		}
		return [
			leftAnchor.constraint(equalTo: view.leftAnchor),
			rightAnchor.constraint(equalTo: view.rightAnchor),
			topAnchor.constraint(equalTo: view.topAnchor),
			bottomAnchor.constraint(equalTo: view.bottomAnchor),
		]
	}
	
	public func constraintsEqualToSafeAreaLayoutGuideOfSuperview() -> [NSLayoutConstraint] {
		return constraintsEqualTo(layoutGuide: superview?.safeAreaLayoutGuide)
	}
	
	public func constraintsEqualTo(layoutGuide: UILayoutGuide?) -> [NSLayoutConstraint] {
		guard let layoutGuide = layoutGuide else {
			return []
		}
		return [
			leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor),
			trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor),
			topAnchor.constraint(equalTo: layoutGuide.topAnchor),
			bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor),
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
