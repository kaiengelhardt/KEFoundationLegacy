import Foundation

public extension Array {
	
	/// Returns an array containing the same items with their positions shuffled.
	///
	/// - Returns: The shuffled array.
	public func shuffled() -> [Element] {
		var shuffledArray: [Element] = []
		shuffledArray.reserveCapacity(count)
		for item in self {
			let index = Int.randomNumber(between: 0, and: shuffledArray.count + 1)
			shuffledArray.insert(item, at: index)
		}
		return shuffledArray
	}
	
	/// Returns an array containing the same items with their positions shuffled. The item at `index` will be first in the returned array.
	///
	/// - Parameter index: The position of the item which should be first in the resulting array.
	/// - Returns: The shuffled array.
	public func shuffledBeginningWithItem(at index: Int) -> [Element] {
		var array = self
		let item = array.remove(at: index)
		var shuffledArray = array.shuffled()
		shuffledArray.insert(item, at: 0)
		return shuffledArray
	}
	
}

public extension Array where Element : Hashable {
	
	/// Returns an array containing the unique elements from the current array.
	public func unique() -> [Element] {
		var result: [Element] = []
		var memory: Set<Element> = []
		
		for element in self {
			guard !memory.contains(element) else { continue }
			result.append(element)
			memory.insert(element)
		}
		
		return result
	}
	
}
