//
//  UIViewController.swift
//  KEFoundation
//
//  Created by Kai Engelhardt on 13.10.17
//  Copyright © 2018 Kai Engelhardt. All rights reserved.
//
//  Distributed under the permissive MIT license
//  Get the latest version from here:
//
//  https://github.com/kaiengelhardt/KEFoundation
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

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
