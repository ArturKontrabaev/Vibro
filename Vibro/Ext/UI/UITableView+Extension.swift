//
//  UITableView+Extension.swift
//  Gromi
//
//  Created by Ivan Apet on 11.02.21.
//

import UIKit

extension UITableView {
    /// Returns reusable ConfigurableTableViewCell object
    ///
    /// - Parameters:
    /// - indexPath: the index path specifying the location of the cell
    /// - cellType: the cell class to dequeue
    /// - Returns: reusable ConfigurableTableViewCell object
    public func dequeueReusableCell<T: UITableViewCell>(ofType type: T.Type) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: type.className) as? T else {
            fatalError("Couldn't find UITableViewCell of class \(type.className)")
        }
        return cell
    }
    
    func register<T: UITableViewCell>(cellClass: T.Type) {
        self.register(UINib(nibName: T.className, bundle: nil), forCellReuseIdentifier: T.className)
    }
    
    func customReload(_ indexPath: IndexPath) {
        if dataSource != nil {
            reloadRows(at: [indexPath], with: .automatic)
        }
    }
}

extension UITableView {
    
    func setAndLayoutTableHeaderView(header: UIView) {
        tableHeaderView = header
        header.setNeedsLayout()
        header.layoutIfNeeded()
        header.frame.size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        tableHeaderView = header
    }
    
    func setTableHeaderViewInContainer(header: UIView) {
        let frame = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        
        let container = UIView(frame: CGRect(origin: .zero, size: frame))
        container.addSubview(header)
        
        tableHeaderView = container
    }
}


/// The table view that sizes itself based on its `contentSize`.
/// This can be useful when the number of cells is limited and we don't want the cells to be reused.
/// You can put this table view in a scrollview in the storyboard with a placeholder height.
open class SelfSizedTableView: UITableView {
    
    override open var contentSize: CGSize {
        didSet { // basically the contentSize gets changed each time a cell is added
            // --> the intrinsicContentSize gets also changed leading to smooth size update
            if oldValue != contentSize {
                invalidateIntrinsicContentSize()
            }
        }
    }
    
    override open var intrinsicContentSize: CGSize {
        return CGSize(width: contentSize.width, height: contentSize.height)
    }
}
