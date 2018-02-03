// Created by Kai Engelhardt on 01.02.18.

import UIKit

public class ContainerView : UIView {
	
	public var embeddedView: UIView? {
		didSet {
			guard oldValue != embeddedView else {
				return
			}
			oldValue?.removeFromSuperview()
			if let newView = embeddedView {
				newView.translatesAutoresizingMaskIntoConstraints = false
				addSubview(newView)
				NSLayoutConstraint.activate(newView.constraintsEqualToEdgesOfSuperview())
			}
		}
	}
	
}
