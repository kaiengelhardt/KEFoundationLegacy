import UIKit

public extension UIViewController {
	
	/// A Boolean value indicating wether the view controller *or any of its parent view controllers* are being presented.
	public var isBeingPresentedRegardlessOfParentViewController: Bool {
		var isBeingPresented = false
		var viewController: UIViewController? = self
		while let current = viewController {
			isBeingPresented = isBeingPresented || current.isBeingPresented
			viewController = current.parent
		}
		return isBeingPresented
	}
	
	/// A Boolean value indicating wether the view controller *or any of its parent view controllers* are being dismissed.
	public var isBeingDismissedRegardlessOfParentViewController: Bool {
		var isBeingDismissed = false
		var viewController: UIViewController? = self
		while let current = viewController {
			isBeingDismissed = isBeingDismissed || current.isBeingDismissed
			viewController = current.parent
		}
		return isBeingDismissed
	}
	
	/// Adds the specified view controller as a child of the current view controller adds the specified view controllers view to the current view controllers view.
	/// 
	/// - Parameters:
	///   - viewController: The view controller to be added as a child.
	/// 
	/// Discussion: This method calls 'didMove(toParentViewController:)' immediately after the view is added as a subview.
	public func addChild(viewController: UIViewController) {
		addChildViewController(viewController)
		view.addSubview(viewController.view)
		viewController.didMove(toParentViewController: self)
	}
	
	/// Removes the specified child view controller from the current view controller and removes the specified view controllers view from the current view controllers view.
	/// 
	/// - Parameters:
	///   - viewController: The view controller to be removed.
	/// 
	/// Discussion: This method calls 'willMove(toParentViewController:)' before the view is removed.
	public func removeChild(viewController: UIViewController) {
		viewController.willMove(toParentViewController: nil)
		viewController.view.removeFromSuperview()
		viewController.removeFromParentViewController()
	}
	
}
