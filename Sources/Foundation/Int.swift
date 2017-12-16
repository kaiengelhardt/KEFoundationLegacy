import Foundation

public extension Int {
	
	public static func randomNumber(between lowerBound: Int, and upperBound: Int) -> Int {
		return Int(arc4random_uniform(UInt32(upperBound - lowerBound))) + lowerBound
	}
	
}
