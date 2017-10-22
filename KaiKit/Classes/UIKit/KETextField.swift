import UIKit

public class KETextField : UITextField {
	
	public var textInsets: UIEdgeInsets = .zero {
		didSet {
			setNeedsDisplay()
			setNeedsLayout()
		}
	}
	
	public var leftViewOffset: CGSize = .zero {
		didSet {
			setNeedsDisplay()
			setNeedsLayout()
		}
	}
	
	public var rightViewOffset: CGSize = .zero {
		didSet {
			setNeedsDisplay()
			setNeedsLayout()
		}
	}
	
	public override func textRect(forBounds bounds: CGRect) -> CGRect {
		let textRect = super.textRect(forBounds: bounds)
		return textRect.insetBy(insets: textInsets)
	}
	
	public override func editingRect(forBounds bounds: CGRect) -> CGRect {
		let textRect = super.textRect(forBounds: bounds)
		return textRect.insetBy(insets: textInsets)
	}
	
	public override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
		let leftViewRect = super.leftViewRect(forBounds: bounds)
		return leftViewRect.offsetBy(dx: leftViewOffset.width, dy: leftViewOffset.height)
	}
	
	public override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
		let rightViewRect = super.rightViewRect(forBounds: bounds)
		return rightViewRect.offsetBy(dx: -rightViewOffset.width, dy: rightViewOffset.height)
	}
	
}
