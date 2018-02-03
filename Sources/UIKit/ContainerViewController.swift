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
				newViewController.view.translatesAutoresizingMaskIntoConstraints = false
				addChild(viewController: newViewController)
				NSLayoutConstraint.activate(newViewController.view.constraintsEqualToEdgesOfSuperview())
			}
		}
	}
	
	public init() {
		super.init(nibName: nil, bundle: nil)
	}
	
	private override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
