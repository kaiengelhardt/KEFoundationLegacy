//
//  UIView.swift
//  KEFoundation
//
//  Created by Kai Engelhardt on 12.10.17
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

public extension UIView {
	
	public func constraintsEqualToEdgesOfSuperview() -> [NSLayoutConstraint] {
		return constraintsEqualToEdges(of: superview)
	}
	
	public func constraintsEqualToEdges(of view: UIView?) -> [NSLayoutConstraint] {
		guard let view = view else {
			return []
		}
		return [
			leadingAnchor.constraint(equalTo: view.leadingAnchor),
			trailingAnchor.constraint(equalTo: view.trailingAnchor),
			topAnchor.constraint(equalTo: view.topAnchor),
			bottomAnchor.constraint(equalTo: view.bottomAnchor),
		]
	}
	
	@available(iOS 11, *)
	public func constraintsEqualToEdgesOfSafeAreaLayoutGuideOfSuperview() -> [NSLayoutConstraint] {
		return constraintsEqualToEdges(of: superview?.safeAreaLayoutGuide)
	}
	
	public func constraintsEqualToEdges(of layoutGuide: UILayoutGuide?) -> [NSLayoutConstraint] {
		guard let layoutGuide = layoutGuide else {
			return []
		}
		return [
			leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor),
			trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor),
			topAnchor.constraint(equalTo: layoutGuide.topAnchor),
			bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor),
		]
	}
	
	public func constraintsEqualToCenterOfSuperView() -> [NSLayoutConstraint] {
		return constraintsEqualToCenter(of: superview)
	}
	
	public func constraintsEqualToCenter(of view: UIView?) -> [NSLayoutConstraint] {
		guard let view = view else {
			return []
		}
		return [
			centerXAnchor.constraint(equalTo: view.centerXAnchor),
			centerYAnchor.constraint(equalTo: view.centerYAnchor),
		]
	}
	
}

extension Array where Element: UIView {
	
	public func disableTranslatesAutoresizingMaskIntoConstraints() {
		for view in self {
			view.translatesAutoresizingMaskIntoConstraints = false
		}
	}
	
}

