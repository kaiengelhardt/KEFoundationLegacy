//
//  ClosureValueTransformer.swift
//  KEFoundation
//
//  Created by Kai Engelhardt on 27.04.18
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

import Foundation

/// Based on [ValueTransformer](https://github.com/objcio/core-data/blob/master/SharedCode/ValueTransformer.swift) by Florian Kugler.
public class ClosureValueTransformer<Source: AnyObject, Destination: AnyObject> : ValueTransformer {
	
	public typealias Transform = (Source?) -> Destination?
	public typealias ReverseTransform = (Destination?) -> Source?
	
	fileprivate let transform: Transform
	fileprivate let reverseTransform: ReverseTransform
	
	public init(transform: @escaping Transform, reverseTransform: @escaping ReverseTransform) {
		self.transform = transform
		self.reverseTransform = reverseTransform
		super.init()
	}
	
	public static func registerTransformer(withName name: String, transform: @escaping Transform, reverseTransform: @escaping ReverseTransform) {
		let vt = ClosureValueTransformer(transform: transform, reverseTransform: reverseTransform)
		Foundation.ValueTransformer.setValueTransformer(vt, forName: NSValueTransformerName(rawValue: name))
	}
	
	override public class func transformedValueClass() -> AnyClass {
		return Destination.self
	}
	
	override public class func allowsReverseTransformation() -> Bool {
		return true
	}
	
	override public func transformedValue(_ value: Any?) -> Any? {
		return transform(value as? Source)
	}
	
	override public func reverseTransformedValue(_ value: Any?) -> Any? {
		return reverseTransform(value as? Destination)
	}
	
}
