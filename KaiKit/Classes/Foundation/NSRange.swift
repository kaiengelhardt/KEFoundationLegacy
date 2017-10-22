import Foundation

extension NSRange {
	
	init(range: Range<Int>) {
		self.init(location: range.lowerBound, length: range.upperBound - range.lowerBound)
	}
	
}
