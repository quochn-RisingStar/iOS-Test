//
//  UITableView.swift
//  TEST_APP
//
//  Created by Quoc Huynh on 23/7/24.
//

import UIKit

public extension UITableView {
    func register<T: UITableViewCell>(_ name: T.Type, at bundleClass: AnyClass? = nil) {
        let identifier = String(describing: name)
        var bundle: Bundle?
        if let bundleName = bundleClass {
            bundle = Bundle(for: bundleName)
        }
        register(UINib(nibName: identifier, bundle: bundle), forCellReuseIdentifier: identifier)
    }

    func registerClass<T: UITableViewCell>(_ name: T.Type) {
        let identifier = String(describing: name)
        register(name, forCellReuseIdentifier: identifier)
    }

    func dequeue<T: UITableViewCell>(_ name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: name), for: indexPath) as? T else {
            fatalError(
                "Couldn't find UITableViewCell for \(String(describing: name)), make sure the cell is registered with table view")
        }
        return cell
    }

    func register<T: UITableViewHeaderFooterView>(_ name: T.Type, at bundleClass: AnyClass? = nil) {
        let identifier = String(describing: name)
        var bundle: Bundle?
        if let bundleName = bundleClass {
            bundle = Bundle(for: bundleName)
        }
        register(UINib(nibName: identifier, bundle: bundle), forHeaderFooterViewReuseIdentifier: identifier)
    }

    func dequeue<T: UITableViewHeaderFooterView>(_ name: T.Type) -> T {
        guard let headerFooterView = dequeueReusableHeaderFooterView(withIdentifier: String(describing: name)) as? T else {
            fatalError(
                "Couldn't find UITableViewHeaderFooterView for \(String(describing: name)), make sure the view is registered with table view")
        }
        return headerFooterView
    }
}

extension UITableView {
    func removeTopSpacingForGrouppedTable() {
        guard style == .grouped else { return }
        var frame = CGRect.zero
        frame.size.height = .leastNormalMagnitude
        tableHeaderView = UIView(frame: frame)
    }
}
