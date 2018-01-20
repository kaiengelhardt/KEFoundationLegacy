import CoreData

public class FetchedResultsUpdater : NSObject {
	
	public enum SectionUpdate {
		case insert(Int)
		case delete(Int)
	}
	
	public enum RowUpdate {
		case insert(IndexPath)
		case delete(IndexPath)
		case update(IndexPath)
		case move(IndexPath, IndexPath)
	}
	
	public weak var delegate: FetchedResultsUpdaterDelegate?
	
	private var sectionUpdates: [SectionUpdate] = []
	private var rowUpdates: [RowUpdate] = []
	
	private var updatesEnabled: Bool = true
	
	public func performWithoutUpdatesEnabled(_ closure: () -> Void) {
		updatesEnabled = false
		closure()
		updatesEnabled = true
	}
	
}

extension FetchedResultsUpdater : NSFetchedResultsControllerDelegate {
	
	public func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
		sectionUpdates = []
		rowUpdates = []
	}
	
	public func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
		switch type {
		case .insert:
			sectionUpdates.append(.insert(sectionIndex))
		case .delete:
			sectionUpdates.append(.delete(sectionIndex))
		default:
			break;
		}
	}
	
	public func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
		switch type {
		case .insert:
			rowUpdates.append(.insert(newIndexPath!))
		case .delete:
			rowUpdates.append(.delete(indexPath!))
		case .update:
			rowUpdates.append(.update(indexPath!))
		case .move:
			rowUpdates.append(.move(indexPath!, newIndexPath!))
		}
	}
	
	public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
		guard updatesEnabled else {
			return
		}
		delegate?.updater(self, didUpdateWithSectionUpdates: sectionUpdates, rowUpdates: rowUpdates)
	}
	
}

public protocol FetchedResultsUpdaterDelegate : class {
	
	func updater(_ updater: FetchedResultsUpdater, didUpdateWithSectionUpdates sectionUpdates: [FetchedResultsUpdater.SectionUpdate], rowUpdates: [FetchedResultsUpdater.RowUpdate])
	
}
