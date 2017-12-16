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
	
}
