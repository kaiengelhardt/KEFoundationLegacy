//
//  UILayoutPriority+Math.swift
//  KEFoundation
//
//  Created by Kai Engelhardt on 08.10.19
//  Copyright © 2019 Kai Engelhardt. All rights reserved.
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

import UIKit

public func +(lhs: UILayoutPriority, rhs: Float) -> UILayoutPriority {
	return UILayoutPriority((lhs.rawValue + rhs).clamped(to: 0...1_000))
}

public func -(lhs: UILayoutPriority, rhs: Float) -> UILayoutPriority {
	return UILayoutPriority((lhs.rawValue - rhs).clamped(to: 0...1_000))
}

public func +(lhs: Float, rhs: UILayoutPriority) -> UILayoutPriority {
	return UILayoutPriority((lhs + rhs.rawValue).clamped(to: 0...1_000))
}

public func -(lhs: Float, rhs: UILayoutPriority) -> UILayoutPriority {
	return UILayoutPriority((lhs - rhs.rawValue).clamped(to: 0...1_000))
}

public func +(lhs: UILayoutPriority, rhs: Int) -> UILayoutPriority {
	return lhs + Float(rhs)
}

public func -(lhs: UILayoutPriority, rhs: Int) -> UILayoutPriority {
	return lhs - Float(rhs)
}

public func +(lhs: Int, rhs: UILayoutPriority) -> UILayoutPriority {
	return Float(lhs) + rhs
}

public func -(lhs: Int, rhs: UILayoutPriority) -> UILayoutPriority {
	return Float(lhs) - rhs
}

public func +(lhs: UILayoutPriority, rhs: UILayoutPriority) -> UILayoutPriority {
	return UILayoutPriority((lhs.rawValue + rhs.rawValue).clamped(to: 0...1_000))
}

public func -(lhs: UILayoutPriority, rhs: UILayoutPriority) -> UILayoutPriority {
	return UILayoutPriority((lhs.rawValue - rhs.rawValue).clamped(to: 0...1_000))
}

extension UILayoutPriority: ExpressibleByIntegerLiteral {
	
	public init(integerLiteral value: Int) {
		self.init(rawValue: Float(value))
	}
	
}

extension UILayoutPriority: ExpressibleByFloatLiteral {
	
	public init(floatLiteral value: Float) {
		self.init(rawValue: value)
	}
	
}
