//
//  LayoutSurface.swift
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

public protocol LayoutSurface {
	
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

public extension LayoutSurface {
	
	#if canImport(UIKit)
	
	public typealias EdgeInsets = UIEdgeInsets
	
	#elseif canImport(AppKit)
	
	public typealias EdgeInsets = NSEdgeInsets
	public typealias NSLayoutRelation = NSLayoutConstraint.Relation
	
	#endif
	
	public func constraintsMatchingEdges(of surface: LayoutSurface?, insetBy inset: EdgeInsets = .zero, relation: NSLayoutRelation = .equal) -> [NSLayoutConstraint] {
		guard let surface = surface else {
			return []
		}
		
		let invertedInset = -inset
		
		let constraints: [NSLayoutConstraint]
		
		switch relation {
		case .equal:
			constraints = [
				surface.leadingAnchor.constraint(equalTo: leadingAnchor, constant: invertedInset.left),
				trailingAnchor.constraint(equalTo: surface.trailingAnchor, constant: invertedInset.right),
				surface.topAnchor.constraint(equalTo: topAnchor, constant: invertedInset.top),
				bottomAnchor.constraint(equalTo: surface.bottomAnchor, constant: invertedInset.bottom),
			]
		case .lessThanOrEqual:
			constraints = [
				surface.leadingAnchor.constraint(lessThanOrEqualTo: leadingAnchor, constant: invertedInset.left),
				trailingAnchor.constraint(lessThanOrEqualTo: surface.trailingAnchor, constant: invertedInset.right),
				surface.topAnchor.constraint(lessThanOrEqualTo: topAnchor, constant: invertedInset.top),
				bottomAnchor.constraint(lessThanOrEqualTo: surface.bottomAnchor, constant: invertedInset.bottom),
			]
		case .greaterThanOrEqual:
			constraints = [
				surface.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: invertedInset.left),
				trailingAnchor.constraint(greaterThanOrEqualTo: surface.trailingAnchor, constant: invertedInset.right),
				surface.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: invertedInset.top),
				bottomAnchor.constraint(greaterThanOrEqualTo: surface.bottomAnchor, constant: invertedInset.bottom),
			]
		}
		
		return constraints
	}
	
	public func constraintsMatchingCenter(of surface: LayoutSurface?, offsetBy offset: CGSize = .zero, relation: NSLayoutRelation = .equal) -> [NSLayoutConstraint] {
		guard let surface = surface else {
			return []
		}
		
		let constraints: [NSLayoutConstraint]
		
		switch relation {
		case .equal:
			constraints = [
				centerXAnchor.constraint(equalTo: surface.centerXAnchor, constant: offset.width),
				centerYAnchor.constraint(equalTo: surface.centerYAnchor, constant: offset.height),
			]
		case .lessThanOrEqual:
			constraints = [
				centerXAnchor.constraint(lessThanOrEqualTo: surface.centerXAnchor, constant: offset.width),
				centerYAnchor.constraint(lessThanOrEqualTo: surface.centerYAnchor, constant: offset.height),
			]
		case .greaterThanOrEqual:
			constraints = [
				centerXAnchor.constraint(greaterThanOrEqualTo: surface.centerXAnchor, constant: offset.width),
				centerYAnchor.constraint(greaterThanOrEqualTo: surface.centerYAnchor, constant: offset.height),
			]
		}
		
		return constraints
	}
	
	public func constraintsMatchingSize(of surface: LayoutSurface?, resizedBy size: CGSize = .zero, multipliedBy multiplier: CGSize = CGSize(width: 1, height: 1), relation: NSLayoutRelation = .equal) -> [NSLayoutConstraint] {
		guard let surface = surface else {
			return []
		}
		
		let constraints: [NSLayoutConstraint]
		
		switch relation {
		case .equal:
			constraints = [
				widthAnchor.constraint(equalTo: surface.widthAnchor, multiplier: multiplier.width, constant: size.width),
				heightAnchor.constraint(equalTo: surface.heightAnchor, multiplier: multiplier.height, constant: size.height),
			]
		case .lessThanOrEqual:
			constraints = [
				widthAnchor.constraint(lessThanOrEqualTo: surface.widthAnchor, multiplier: multiplier.width, constant: size.width),
				heightAnchor.constraint(lessThanOrEqualTo: surface.heightAnchor, multiplier: multiplier.height, constant: size.height),
			]
		case .greaterThanOrEqual:
			constraints = [
				widthAnchor.constraint(greaterThanOrEqualTo: surface.widthAnchor, multiplier: multiplier.width, constant: size.width),
				heightAnchor.constraint(greaterThanOrEqualTo: surface.heightAnchor, multiplier: multiplier.height, constant: size.height),
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

extension View : LayoutSurface {
	
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

extension UILayoutGuide : LayoutSurface {}

#elseif canImport(AppKit)

extension NSLayoutGuide : LayoutSurface {}

#endif
