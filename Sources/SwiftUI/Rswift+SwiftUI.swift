//
//  Rswift+SwiftUI.swift
//  KEFoundation
//
//  Created by Kai Engelhardt on 13.10.2020
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

#if canImport(Rswift)

import SwiftUI
import Rswift

extension FontResource {
	
	/// Allows using R.swift font resources in SwiftUI.
	///
	/// Example usage:
	/// ```
	/// Text("Title")
	/// 	.font(R.font.verdana.font(size: 16)
	/// ```
	@available(iOS 13, *)
	public func font(size: CGFloat) -> Font {
		Font.custom(fontName, size: size)
	}
	
	/// Allows using R.swift font resources in SwiftUI.
	///
	/// Example usage:
	/// ```
	/// Text("Title")
	/// 	.font(R.font.verdana.font(fixedSize: 16)
	/// ```
	@available(iOS 14, *)
	public func font(fixedSize: CGFloat) -> Font {
		Font.custom(fontName, fixedSize: fixedSize)
	}
	
	/// Allows using R.swift font resources in SwiftUI.
	///
	/// Example usage:
	/// ```
	/// Text("Title")
	/// 	.font(R.font.verdana.font(size: 16, relativeTo: .body)
	/// ```
	@available(iOS 14, *)
	public func font(size: CGFloat, relativeTo textStyle: Font.TextStyle) -> Font {
		Font.custom(fontName, size: size, relativeTo: textStyle)
	}
	
}

extension ColorResource {
	
	/// Allows using R.swift color resources in SwiftUI.
	///
	/// Example usage:
	/// ```
	/// Text("Title")
	/// 	.foregroundColor(R.color.settingsTitle.color)
	/// ```
	@available(iOS 13, *)
	public var color: Color {
		Color(name, bundle: bundle)
	}
	
}

extension ImageResource {
	
	/// Allows using R.swift image resources in SwiftUI.
	///
	/// Example usage:
	/// ```
	/// R.image.buttonBackground.image
	/// 	.resizable()
	/// 	.aspectRatio(contentMode: .fill)
	/// ```
	@available(iOS 13, *)
	public var image: Image {
		Image(name, bundle: bundle)
	}
	
}

extension StringResource {
	
	@available(iOS 13, *)
	public var localizedStringKey: LocalizedStringKey {
		LocalizedStringKey(key)
	}
	
}

@available(iOS 13, *)
extension Text {
	
	/// Allows using R.swift string resources in SwiftUI.
	///
	/// Example usage:
	/// ```
	/// Text(R.string.settings.title)
	/// ```
	public init(_ stringResource: StringResource) {
		self.init(
			stringResource.localizedStringKey,
			tableName: stringResource.tableName,
			bundle: stringResource.bundle,
			comment: nil
		)
	}
	
}

#endif
