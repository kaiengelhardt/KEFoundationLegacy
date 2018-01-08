import Foundation

public extension FileManager {
	
	public class var documentDirectoryURL: URL {
		return self.default.urls(for: .documentDirectory, in: .userDomainMask).first!
	}
	
	public class var libraryDirectoryURL: URL {
		return self.default.urls(for: .libraryDirectory, in: .userDomainMask).first!
	}
	
	public class func groupContainerURL(for groupIdentifier: String) -> URL {
		return self.default.containerURL(forSecurityApplicationGroupIdentifier: groupIdentifier)!
	}
	
	public class func groupContainerLibraryDirectoryURL(for groupIdentifier: String) -> URL {
		return groupContainerURL(for: groupIdentifier).appendingPathComponent("Library")
	}
	
	public class func groupContainerDatabaseDirectoryURL(for groupIdentifier: String) -> URL {
		let url = groupContainerLibraryDirectoryURL(for: groupIdentifier).appendingPathComponent("Database")
		if !self.default.fileExists(atPath: url.absoluteString, isDirectory: nil) {
			try! self.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
		}
		return url
	}
	
}
