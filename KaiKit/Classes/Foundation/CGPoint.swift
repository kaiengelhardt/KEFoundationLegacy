import Foundation

public extension CGPoint {
	
	public init(size: CGSize) {
		self.init(x: size.width, y: size.height)
	}
	
}

public func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
	return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

public func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
	return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
}

public func *(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
	return CGPoint(x: lhs.x * rhs.x, y: lhs.y * rhs.y)
}

public func *(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
	return CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
}

public func *(lhs: CGFloat, rhs: CGPoint) -> CGPoint {
	return CGPoint(x: lhs * rhs.x, y: lhs * rhs.y)
}

public func /(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
	return CGPoint(x: lhs.x / rhs.x, y: lhs.y / rhs.y)
}

public func /(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
	return CGPoint(x: lhs.x / rhs, y: lhs.y / rhs)
}
