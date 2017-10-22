import Foundation

public extension Date {
	
	public var normalizedDate: Date {
		var calendar = Calendar(identifier: .gregorian)
		calendar.timeZone = TimeZone(secondsFromGMT: 0)!
		let dateComponents = calendar.dateComponents([.year, .month, .day], from: self)
		let date = calendar.date(from: dateComponents)!
		return date
	}
	
}
