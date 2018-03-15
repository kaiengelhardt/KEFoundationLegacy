import UIKit

public extension UIView {
	
	public func constraintsEqualToEdgesOfSuperview() -> [NSLayoutConstraint] {
		return constraintsEqualToEdges(of: superview)
	}
	
	public func constraintsEqualToEdges(of view: UIView?) -> [NSLayoutConstraint] {
		guard let view = view else {
			return []
		}
		return [
			leadingAnchor.constraint(equalTo: view.leadingAnchor),
			trailingAnchor.constraint(equalTo: view.trailingAnchor),
			topAnchor.constraint(equalTo: view.topAnchor),
			bottomAnchor.constraint(equalTo: view.bottomAnchor),
		]
	}
	
	@available(iOS 11, *)
	public func constraintsEqualToEdgesOfSafeAreaLayoutGuideOfSuperview() -> [NSLayoutConstraint] {
		return constraintsEqualToEdges(of: superview?.safeAreaLayoutGuide)
	}
	
	public func constraintsEqualToEdges(of layoutGuide: UILayoutGuide?) -> [NSLayoutConstraint] {
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
	
	public func constraintsEqualToCenterOfSuperView() -> [NSLayoutConstraint] {
		return constraintsEqualToCenter(of: superview)
	}
	
	public func constraintsEqualToCenter(of view: UIView?) -> [NSLayoutConstraint] {
		guard let view = view else {
			return []
		}
		return [
			centerXAnchor.constraint(equalTo: view.centerXAnchor),
			centerYAnchor.constraint(equalTo: view.centerYAnchor),
		]
	}
	
}

extension Array where Element: UIView {
	
	public func disableTranslatesAutoresizingMaskIntoConstraints() {
		for view in self {
			view.translatesAutoresizingMaskIntoConstraints = false
		}
	}
	
}

