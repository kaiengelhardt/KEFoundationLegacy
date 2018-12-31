//
//  NSDateTests.swift
//  KEFoundation
//
//  Created by Kai Engelhardt on 24.01.18
//  Copyright © 2018 Kai Engelhardt. All rights reserved.
//
//  Distributed under the permissive MIT license
//  Get the latest version from here:
//
//  https://github.com/kaiengelhardt/KEFoundation
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

@testable import KEFoundation
import XCTest

class NSDateTests: XCTestCase {
	
	func testNormalized() {
		var calendar = Calendar(identifier: .gregorian)
		calendar.timeZone = TimeZone(secondsFromGMT: 0)!
		
		var dateComponents = DateComponents()
		dateComponents.year = 1_993
		dateComponents.month = 1
		dateComponents.day = 26
		dateComponents.hour = 12
		dateComponents.minute = 37
		dateComponents.second = 15
		
		let date = calendar.date(from: dateComponents)!
		let normalizedDate = date.normalized
		let resultDateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: normalizedDate)
		
		XCTAssertEqual(resultDateComponents.year, 1_993)
		XCTAssertEqual(resultDateComponents.month, 1)
		XCTAssertEqual(resultDateComponents.day, 26)
		XCTAssertEqual(resultDateComponents.hour, 0)
		XCTAssertEqual(resultDateComponents.minute, 0)
		XCTAssertEqual(resultDateComponents.second, 0)
	}
	
}
