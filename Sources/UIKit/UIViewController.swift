import UIKit

public extension UIViewController {
	
	public var isBeingPresentedRegardlessOfParentViewController: Bool {
		var isBeingPresented = false
		var viewController: UIViewController? = self
		while let current = viewController {
			isBeingPresented = isBeingPresented || current.isBeingPresented
			viewController = current.parent
		}
		return isBeingPresented
	}
	
	public var isBeingDismissedRegardlessOfParentViewController: Bool {
		var isBeingDismissed = false
		var viewController: UIViewController? = self
		while let current = viewController {
			isBeingDismissed = isBeingDismissed || current.isBeingDismissed
			viewController = current.parent
		}
		return isBeingDismissed
	}
	
	public func add(childViewController: UIViewController) {
		addChildViewController(childViewController)
		view.addSubview(childViewController.view)
		childViewController.didMove(toParentViewController: self)
	}
	
	public func remove(childViewController: UIViewController) {
		childViewController.willMove(toParentViewController: nil)
		childViewController.view.removeFromSuperview()
		childViewController.removeFromParentViewController()
	}
	
}
