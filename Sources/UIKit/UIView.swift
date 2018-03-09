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
			leadingAnchor.constraint(equalTo: view.leadingAnchor),
			trailingAnchor.constraint(equalTo: view.trailingAnchor),
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

extension Array where Element: UIView {
	
	public func disableTranslatesAutoresizingMaskIntoConstraints() {
		for view in self {
			view.translatesAutoresizingMaskIntoConstraints = false
		}
	}
	
}
