import XCTest
@testable import KEFoundation

class CGRect_Tests: XCTestCase {
    
	func testInsetBy() {
		let rect = CGRect(x: 30, y: 0, width: 100, height: 80)
		let insets = UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 40)
		let result = rect.insetBy(insets: insets)
		XCTAssertEqual(result, CGRect(x: 50, y: 10, width: 40, height: 40))
	}
    
}
