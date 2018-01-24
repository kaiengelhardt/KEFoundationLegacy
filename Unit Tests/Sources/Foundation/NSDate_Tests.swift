import XCTest
@testable import KEFoundation

class NSDate_Tests: XCTestCase {
	
	func testNormalized() {
		var calendar = Calendar(identifier: .gregorian)
		calendar.timeZone = TimeZone(secondsFromGMT: 0)!
		
		var dateComponents = DateComponents()
		dateComponents.year = 1993
		dateComponents.month = 1
		dateComponents.day = 26
		dateComponents.hour = 12
		dateComponents.minute = 37
		dateComponents.second = 15
		
		let date = calendar.date(from: dateComponents)!
		let normalizedDate = date.normalized
		let resultDateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: normalizedDate)
		
		XCTAssertEqual(resultDateComponents.year, 1993)
		XCTAssertEqual(resultDateComponents.month, 1)
		XCTAssertEqual(resultDateComponents.day, 26)
		XCTAssertEqual(resultDateComponents.hour, 0)
		XCTAssertEqual(resultDateComponents.minute, 0)
		XCTAssertEqual(resultDateComponents.second, 0)
	}
	
}
