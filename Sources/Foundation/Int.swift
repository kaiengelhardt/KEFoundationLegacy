import Foundation

public extension Int {
	
	/// Generates a random number between lowerBound and upperBound.
	///
	/// - Parameters:
	///   - lowerBound: The minimum value (inclusive).
	///   - upperBound: The maximum value (inclusive).
	/// - Returns: A random number between lowerBound and upperBound.
	public static func randomNumber(between lowerBound: Int, and upperBound: Int) -> Int {
		return Int(arc4random_uniform(UInt32(upperBound - lowerBound))) + lowerBound
	}
	
}
