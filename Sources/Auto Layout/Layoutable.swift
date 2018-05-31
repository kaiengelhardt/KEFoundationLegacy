//
//  Layoutable.swift
//  KEFoundation
//
//  Created by Kai Engelhardt on 29.05.18
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

#if canImport(UIKit)

import UIKit

#elseif canImport(AppKit)

import AppKit

#endif

public protocol Layoutable {
	
	var leadingAnchor: NSLayoutXAxisAnchor { get }
	var trailingAnchor: NSLayoutXAxisAnchor { get }
	var leftAnchor: NSLayoutXAxisAnchor { get }
	var rightAnchor: NSLayoutXAxisAnchor { get }
	var topAnchor: NSLayoutYAxisAnchor { get }
	var bottomAnchor: NSLayoutYAxisAnchor { get }
	var widthAnchor: NSLayoutDimension { get }
	var heightAnchor: NSLayoutDimension { get }
	var centerXAnchor: NSLayoutXAxisAnchor { get }
	var centerYAnchor: NSLayoutYAxisAnchor { get }
	
}

public extension Layoutable {
	
	#if canImport(UIKit)
	
	public typealias EdgeInsets = UIEdgeInsets
	
	#elseif canImport(AppKit)
	
	public typealias EdgeInsets = NSEdgeInsets
	public typealias NSLayoutRelation = NSLayoutConstraint.Relation
	
	#endif
	
	public func constraintsMatchingEdges(of layoutable: Layoutable?, insetBy inset: EdgeInsets = .zero, relation: NSLayoutRelation = .equal) -> [NSLayoutConstraint] {
		guard let layoutable = layoutable else {
			return []
		}
		
		let invertedInset = -inset
		
		let constraints: [NSLayoutConstraint]
		
		switch relation {
		case .equal:
			constraints = [
				layoutable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: invertedInset.left),
				trailingAnchor.constraint(equalTo: layoutable.trailingAnchor, constant: invertedInset.right),
				layoutable.topAnchor.constraint(equalTo: topAnchor, constant: invertedInset.top),
				bottomAnchor.constraint(equalTo: layoutable.bottomAnchor, constant: invertedInset.bottom),
			]
		case .lessThanOrEqual:
			constraints = [
				layoutable.leadingAnchor.constraint(lessThanOrEqualTo: leadingAnchor, constant: invertedInset.left),
				trailingAnchor.constraint(lessThanOrEqualTo: layoutable.trailingAnchor, constant: invertedInset.right),
				layoutable.topAnchor.constraint(lessThanOrEqualTo: topAnchor, constant: invertedInset.top),
				bottomAnchor.constraint(lessThanOrEqualTo: layoutable.bottomAnchor, constant: invertedInset.bottom),
			]
		case .greaterThanOrEqual:
			constraints = [
				layoutable.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: invertedInset.left),
				trailingAnchor.constraint(greaterThanOrEqualTo: layoutable.trailingAnchor, constant: invertedInset.right),
				layoutable.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: invertedInset.top),
				bottomAnchor.constraint(greaterThanOrEqualTo: layoutable.bottomAnchor, constant: invertedInset.bottom),
			]
		}
		
		return constraints
	}
	
	public func constraintsMatchingCenter(of layoutable: Layoutable?, offsetBy offset: CGSize = .zero, relation: NSLayoutRelation = .equal) -> [NSLayoutConstraint] {
		guard let layoutable = layoutable else {
			return []
		}
		
		let constraints: [NSLayoutConstraint]
		
		switch relation {
		case .equal:
			constraints = [
				centerXAnchor.constraint(equalTo: layoutable.centerXAnchor, constant: offset.width),
				centerYAnchor.constraint(equalTo: layoutable.centerYAnchor, constant: offset.height),
			]
		case .lessThanOrEqual:
			constraints = [
				centerXAnchor.constraint(lessThanOrEqualTo: layoutable.centerXAnchor, constant: offset.width),
				centerYAnchor.constraint(lessThanOrEqualTo: layoutable.centerYAnchor, constant: offset.height),
			]
		case .greaterThanOrEqual:
			constraints = [
				centerXAnchor.constraint(greaterThanOrEqualTo: layoutable.centerXAnchor, constant: offset.width),
				centerYAnchor.constraint(greaterThanOrEqualTo: layoutable.centerYAnchor, constant: offset.height),
			]
		}
		
		return constraints
	}
	
	public func constraintsMatchingSize(of layoutable: Layoutable?, resizedBy size: CGSize = .zero, multipliedBy multiplier: CGSize = CGSize(width: 1, height: 1), relation: NSLayoutRelation = .equal) -> [NSLayoutConstraint] {
		guard let layoutable = layoutable else {
			return []
		}
		
		let constraints: [NSLayoutConstraint]
		
		switch relation {
		case .equal:
			constraints = [
				widthAnchor.constraint(equalTo: layoutable.widthAnchor, multiplier: multiplier.width, constant: size.width),
				heightAnchor.constraint(equalTo: layoutable.heightAnchor, multiplier: multiplier.height, constant: size.height),
			]
		case .lessThanOrEqual:
			constraints = [
				widthAnchor.constraint(lessThanOrEqualTo: layoutable.widthAnchor, multiplier: multiplier.width, constant: size.width),
				heightAnchor.constraint(lessThanOrEqualTo: layoutable.heightAnchor, multiplier: multiplier.height, constant: size.height),
			]
		case .greaterThanOrEqual:
			constraints = [
				widthAnchor.constraint(greaterThanOrEqualTo: layoutable.widthAnchor, multiplier: multiplier.width, constant: size.width),
				heightAnchor.constraint(greaterThanOrEqualTo: layoutable.heightAnchor, multiplier: multiplier.height, constant: size.height),
			]
		}
		
		return constraints
	}
	
	public func aspectRationConstraint() -> NSLayoutConstraint {
		return widthAnchor.constraint(equalTo: heightAnchor, multiplier: 1, constant: 0)
	}
	
}

#if canImport(UIKit)

private typealias View = UIView

#elseif canImport(AppKit)

private typealias View = NSView

#endif

extension View : Layoutable {
	
	#if canImport(UIKit)
	
	public typealias EdgeInsets = UIEdgeInsets
	
	#elseif canImport(AppKit)
	
	public typealias EdgeInsets = NSEdgeInsets
	public typealias NSLayoutRelation = NSLayoutConstraint.Relation
	
	#endif
	
	public func constraintsMatchingEdgesOfSuperview(insetBy insets: EdgeInsets = .zero, relation: NSLayoutRelation = .equal) -> [NSLayoutConstraint] {
		return constraintsMatchingEdges(of: superview, insetBy: insets, relation: relation)
	}
	
	public func constraintsMatchingCenterOfSuperview(offsetBy offset: CGSize = .zero, relation: NSLayoutRelation = .equal) -> [NSLayoutConstraint] {
		return constraintsMatchingCenter(of: superview, offsetBy: offset, relation: relation)
	}
	
	public func constraintsMatchingSizeOfSuperview(resizedBy size: CGSize = .zero, multipliedBy multiplier: CGSize = CGSize(width: 1, height: 1), relation: NSLayoutRelation = .equal) -> [NSLayoutConstraint] {
		return constraintsMatchingSize(of: superview, resizedBy: size, multipliedBy: multiplier, relation: relation)
	}
	
}

#if canImport(UIKit)

extension UILayoutGuide : Layoutable {}

#elseif canImport(AppKit)

extension NSLayoutGuide : Layoutable {}

#endif
