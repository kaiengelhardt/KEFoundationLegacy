import Foundation

public extension FileManager {
	
	public class var documentDirectoryURL: URL {
		return self.default.urls(for: .documentDirectory, in: .userDomainMask).first!
	}
	
	public class var libraryDirectoryURL: URL {
		return self.default.urls(for: .libraryDirectory, in: .userDomainMask).first!
	}
	
	public class var cachesDirectoryURL: URL {
		return self.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
	}
	
	// MARK: - App Group Container Directories
	
	public class func groupContainerURL(for groupIdentifier: String) -> URL {
		return self.default.containerURL(forSecurityApplicationGroupIdentifier: groupIdentifier)!
	}
	
	public class func groupContainerLibraryDirectoryURL(for groupIdentifier: String) -> URL {
		return groupContainerURL(for: groupIdentifier).appendingPathComponent("Library")
	}
	
	public class func groupContainerCachesDirectoryURL(for groupIdentifier: String) -> URL {
		return groupContainerLibraryDirectoryURL(for: groupIdentifier).appendingPathComponent("Caches")
	}
	
}
