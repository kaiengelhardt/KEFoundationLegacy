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

public extension UITableView {
	
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
