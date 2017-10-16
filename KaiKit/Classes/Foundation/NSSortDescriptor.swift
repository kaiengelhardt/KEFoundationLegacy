import Foundation

public extension NSSortDescriptor {
	
	public typealias Order = (AnyObject, AnyObject) -> Bool
	
	public var order: Order {
		return {
			return self.compare($0, to: $1) == .orderedAscending
		}
	}
	
}

public extension Array where Element: NSSortDescriptor {
	
	public typealias Order = (AnyObject, AnyObject) -> Bool
	
	public var order: Order {
		return {
			var comparisonResult: ComparisonResult = .orderedSame
			for sortDescriptor in self {
				comparisonResult = sortDescriptor.compare($0, to: $1)
				if comparisonResult != .orderedSame {
					break
				}
			}
			return comparisonResult == .orderedAscending
		}
	}
	
}
