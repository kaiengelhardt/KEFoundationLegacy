// Created by Kai Engelhardt on 23.02.18.

import Foundation

public prefix func -(insets: UIEdgeInsets) -> UIEdgeInsets {
	return UIEdgeInsets(top: -insets.top, left: -insets.left, bottom: -insets.bottom, right: -insets.right)
}
