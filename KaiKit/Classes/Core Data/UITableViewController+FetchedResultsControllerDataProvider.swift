import UIKit

extension UITableView : FetchedResultsControllerDataProviderDelegate {
	
	public func dataProvider(_ dataProvider: FetchedResultsControllerDataProvider, didUpdateWithSectionUpdates sectionUpdates: [FetchedResultsControllerDataProvider.SectionUpdate], rowUpdates: [FetchedResultsControllerDataProvider.RowUpdate]) {
		performBatchUpdates({
			for update in sectionUpdates {
				switch update {
				case .insert(let sectionIndex):
					insertSections(IndexSet(integer: sectionIndex), with: .automatic)
				case .delete(let sectionIndex):
					deleteSections(IndexSet(integer: sectionIndex), with: .automatic)
				}
			}
			
			for update in rowUpdates {
				switch update {
				case .insert(let indexPath):
					insertRows(at: [indexPath], with: .automatic)
				case .delete(let indexPath):
					deleteRows(at: [indexPath], with: .automatic)
				case .update(let indexPath):
					reloadRows(at: [indexPath], with: .automatic)
				case .move(let fromIndexPath, let toIndexPath):
					reloadRows(at: [fromIndexPath], with: .automatic)
					moveRow(at: fromIndexPath, to: toIndexPath)
				}
			}
		}, completion: nil)
	}
	
}