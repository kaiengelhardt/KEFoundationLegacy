import UIKit

public extension UITableView {
    
    public struct StaticSection {
        public var headerTitle: String?
        public var footerTitle: String?
        public var cells: [UITableViewCell]
        
        public init(cells: [UITableViewCell], headerTitle: String? = nil, footerTitle: String? = nil) {
            self.cells = cells
            self.headerTitle = headerTitle
            self.footerTitle = footerTitle
        }
    }
    
}

public extension Array where Element == UITableView.StaticSection {
    
    public subscript(indexPath: IndexPath) -> UITableViewCell {
        return self[indexPath.section].cells[indexPath.row]
    }
    
}

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
	
	public func deselectCurrentlySelectRow(with transitionCoordinator: UIViewControllerTransitionCoordinator?) {
		let indexPath = indexPathForSelectedRow
		if let indexPath = indexPath {
			deselectRow(at: indexPath, animated: true)
			transitionCoordinator?.notifyWhenInteractionChanges { [weak self] (context) in
				if context.isCancelled {
					self?.selectRow(at: indexPath, animated: false, scrollPosition: .none)
				}
			}
		}
	}
	
}
