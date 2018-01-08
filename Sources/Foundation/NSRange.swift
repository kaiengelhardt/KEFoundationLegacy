import Foundation

public extension NSRange {
	
	public init(range: Range<Int>) {
		self.init(location: range.lowerBound, length: range.upperBound - range.lowerBound)
	}
	
}
