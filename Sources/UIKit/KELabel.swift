// Created by Kai Engelhardt on 23.02.18.

import UIKit

public class KELabel : UILabel {
	
	public var textInsets: UIEdgeInsets = .zero {
		didSet {
			invalidateIntrinsicContentSize()
		}
	}
	
	public override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
		let insetRect = bounds.insetBy(insets: textInsets)
		let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
		let invertedInsets = -textInsets
		return textRect.insetBy(insets: invertedInsets)
	}
	
	public override func drawText(in rect: CGRect) {
		super.drawText(in: UIEdgeInsetsInsetRect(rect, textInsets))
	}
	
}

