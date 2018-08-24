//
//  KETextField.swift
//  KEFoundation
//
//  Created by Kai Engelhardt on 22.10.17
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

import UIKit

public class KETextField: UITextField {
	
	public var textInsets: UIEdgeInsets = .zero {
		didSet {
			setNeedsDisplay()
			setNeedsLayout()
		}
	}
	
	public var leftViewOffset: CGSize = .zero {
		didSet {
			setNeedsDisplay()
			setNeedsLayout()
		}
	}
	
	public var rightViewOffset: CGSize = .zero {
		didSet {
			setNeedsDisplay()
			setNeedsLayout()
		}
	}
	
	override public func textRect(forBounds bounds: CGRect) -> CGRect {
		let textRect = super.textRect(forBounds: bounds)
		return textRect.insetBy(insets: textInsets)
	}
	
	override public func editingRect(forBounds bounds: CGRect) -> CGRect {
		let textRect = super.textRect(forBounds: bounds)
		return textRect.insetBy(insets: textInsets)
	}
	
	override public func leftViewRect(forBounds bounds: CGRect) -> CGRect {
		let leftViewRect = super.leftViewRect(forBounds: bounds)
		return leftViewRect.offsetBy(dx: leftViewOffset.width, dy: leftViewOffset.height)
	}
	
	override public func rightViewRect(forBounds bounds: CGRect) -> CGRect {
		let rightViewRect = super.rightViewRect(forBounds: bounds)
		return rightViewRect.offsetBy(dx: -rightViewOffset.width, dy: rightViewOffset.height)
	}
	
}
