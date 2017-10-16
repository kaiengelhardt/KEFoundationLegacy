import Foundation

public extension CGSize {
	
	public var asCGPoint: CGPoint {
		return CGPoint(x: width, y: height)
	}
	
}

public func +(lhs: CGSize, rhs: CGSize) -> CGSize {
	return CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
}

public func -(lhs: CGSize, rhs: CGSize) -> CGSize {
	return CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
}

public func *(lhs: CGSize, rhs: CGSize) -> CGSize {
	return CGSize(width: lhs.width * rhs.width, height: lhs.height * rhs.height)
}

public func *(lhs: CGSize, rhs: CGFloat) -> CGSize {
	return CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
}

public func *(lhs: CGFloat, rhs: CGSize) -> CGSize {
	return CGSize(width: lhs * rhs.width, height: lhs * rhs.height)
}

public func /(lhs: CGSize, rhs: CGSize) -> CGSize {
	return CGSize(width: lhs.width / rhs.width, height: lhs.height / rhs.height)
}

public func /(lhs: CGSize, rhs: CGFloat) -> CGSize {
	return CGSize(width: lhs.width / rhs, height: lhs.height / rhs)
}
