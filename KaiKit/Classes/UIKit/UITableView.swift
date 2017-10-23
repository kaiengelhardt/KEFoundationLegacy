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
