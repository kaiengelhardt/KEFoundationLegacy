import UIKit

extension UICollectionView : FetchedResultsUpdaterDelegate {
	
	public func updater(_ updater: FetchedResultsUpdater, didUpdateWithSectionUpdates sectionUpdates: [FetchedResultsUpdater.SectionUpdate], rowUpdates: [FetchedResultsUpdater.RowUpdate]) {
		performBatchUpdates({
			for update in sectionUpdates {
				switch update {
				case .insert(let sectionIndex):
					insertSections(IndexSet(integer: sectionIndex))
				case .delete(let sectionIndex):
					deleteSections(IndexSet(integer: sectionIndex))
				}
			}
			
			for update in rowUpdates {
				switch update {
				case .insert(let indexPath):
					insertItems(at: [indexPath])
				case .delete(let indexPath):
					deleteItems(at: [indexPath])
				case .update(let indexPath):
					reloadItems(at: [indexPath])
				case .move(let fromIndexPath, let toIndexPath):
					reloadItems(at: [fromIndexPath, toIndexPath])
				}
			}
		}, completion: nil)
	}
	
}
