import UIKit

open class ContainerViewController : UIViewController {
	
	public var embeddedViewController: UIViewController? {
		didSet {
			guard oldValue != embeddedViewController else {
				return
			}
			if let oldViewController = oldValue {
				removeChild(viewController: oldViewController)
			}
			if let newViewController = embeddedViewController {
				addChild(viewController: newViewController)
				NSLayoutConstraint.activate(newViewController.view.constraintsEqualToEdgesOfSuperview())
			}
		}
	}
	
}
