//
//  FileManager.swift
//  KEFoundation
//
//  Created by Kai Engelhardt on 08.01.18
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

public extension FileManager {
	
	class var documentDirectoryURL: URL {
		return self.default.urls(for: .documentDirectory, in: .userDomainMask).first!
	}
	
	class var libraryDirectoryURL: URL {
		return self.default.urls(for: .libraryDirectory, in: .userDomainMask).first!
	}
	
	class var cachesDirectoryURL: URL {
		return self.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
	}
	
	// MARK: - App Group Container Directories
	
	class func groupContainerURL(for groupIdentifier: String) -> URL {
		return self.default.containerURL(forSecurityApplicationGroupIdentifier: groupIdentifier)!
	}
	
	class func groupContainerLibraryDirectoryURL(for groupIdentifier: String) -> URL {
		return groupContainerURL(for: groupIdentifier).appendingPathComponent("Library")
	}
	
	class func groupContainerCachesDirectoryURL(for groupIdentifier: String) -> URL {
		return groupContainerLibraryDirectoryURL(for: groupIdentifier).appendingPathComponent("Caches")
	}
	
}
