import XCTest
@testable import KEFoundation

class CGPoint_Tests: XCTestCase {
	
	func testInitWithSize() {
		let result = CGPoint(size: CGSize(width: 10, height: 20))
		XCTAssertEqual(result, CGPoint(x: 10, y: 20))
	}
	
    func testAddition() {
		let result = CGPoint(x: 10, y: 10) + CGPoint(x: 20, y: 20)
		XCTAssertEqual(result, CGPoint(x: 30, y: 30))
    }
	
	func testSubtraction() {
		let result = CGPoint(x: 20, y: 20) - CGPoint(x: 10, y: 10)
		XCTAssertEqual(result, CGPoint(x: 10, y: 10))
	}
	
	func testScalarMultipliation() {
		let result = CGPoint(x: 10, y: 10) * 20
		XCTAssertEqual(result, CGPoint(x: 200, y: 200))
		
		let result2 = 20 * CGPoint(x: 10, y: 10)
		XCTAssertEqual(result2, CGPoint(x: 200, y: 200))
	}
	
	func testElementWiseMultiplication() {
		let result = CGPoint(x: 10, y: 20) * CGPoint(x: 5, y: 2)
		XCTAssertEqual(result, CGPoint(x: 50, y: 40))
	}
	
	func testScalarDivision() {
		let result = CGPoint(x: 100, y: 200) / 20
		XCTAssertEqual(result, CGPoint(x: 5, y: 10))
	}
	
	func testElementWiseDivision() {
		let result = CGPoint(x: 10, y: 20) / CGPoint(x: 5, y: 2)
		XCTAssertEqual(result, CGPoint(x: 2, y: 10))
	}
	
}
