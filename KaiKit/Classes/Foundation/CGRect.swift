import Foundation

public extension CGRect {
	
	public func insetBy(insets: UIEdgeInsets) -> CGRect {
		return CGRect(x: origin.x + insets.left, y: origin.y + insets.top, width: width - (insets.left + insets.right), height: height - (insets.top + insets.bottom))
	}
	
}
