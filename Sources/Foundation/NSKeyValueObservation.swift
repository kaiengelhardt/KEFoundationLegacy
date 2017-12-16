import Foundation

public typealias KeyValueObservationBag = Set<NSKeyValueObservation>

public extension NSKeyValueObservation {
	
	public func addTo(_ observationBag: inout KeyValueObservationBag) {
		observationBag.insert(self)
	}
	
}
