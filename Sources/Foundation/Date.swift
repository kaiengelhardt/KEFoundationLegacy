import Foundation

public extension Date {
	
	/// Returns a date which is set to 12am (0:00) in GMT+0.
	public var normalized: Date {
		var calendar = Calendar(identifier: .gregorian)
		calendar.timeZone = TimeZone(secondsFromGMT: 0)!
		let dateComponents = calendar.dateComponents([.year, .month, .day], from: self)
		let date = calendar.date(from: dateComponents)!
		return date
	}
	
}
