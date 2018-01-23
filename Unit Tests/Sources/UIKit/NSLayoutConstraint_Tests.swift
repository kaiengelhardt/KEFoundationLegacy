import XCTest
@testable import KEFoundation

class NSLayoutConstraint_Tests: XCTestCase {
    
	func testConstraintWithPriority() {
		let constraint = NSLayoutConstraint().with(priority: .defaultLow)
		XCTAssertEqual(constraint.priority, .defaultLow)
	}
    
}
