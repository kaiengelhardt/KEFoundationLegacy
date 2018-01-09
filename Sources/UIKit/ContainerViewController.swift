import UIKit

open class ContainerViewController : UIViewController {
	
	public var embeddedViewController: UIViewController? {
		didSet {
			guard oldValue != embeddedViewController else {
				return
			}
			if let oldViewController = oldValue {
				remove(childViewController: oldViewController)
			}
			if let newViewController = embeddedViewController {
				add(childViewController: newViewController)
				NSLayoutConstraint.activate(newViewController.view.constraintsEqualToEdgesOfSuperview())
			}
		}
	}
	
}
