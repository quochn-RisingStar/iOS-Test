//
//  UICollectionView.swift
//  TEST_APP
//
//  Created by Quoc Huynh on 22/7/24.
//

import UIKit

public extension UICollectionView {
    func dequeue<T: UICollectionViewCell>(_ name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: name), for: indexPath) as? T else {
            fatalError(
                "Couldn't find UICollectionViewCell for \(String(describing: name)), make sure the cell is registered with collection view")
        }
        return cell
    }

    func register<T: UICollectionViewCell>(_ name: T.Type, at bundleClass: AnyClass? = nil) {
        let identifier = String(describing: name)
        var bundle: Bundle?
        if let bundleName = bundleClass {
            bundle = Bundle(for: bundleName)
        }
        register(UINib(nibName: identifier, bundle: bundle), forCellWithReuseIdentifier: identifier)
    }

    func registerClass<T: UICollectionViewCell>(_ name: T.Type) {
        let identifier = String(describing: name)
        register(name, forCellWithReuseIdentifier: identifier)
    }

    func register<T: UICollectionReusableView>(header: T.Type) {
        let identifier = String(describing: header)
        register(UINib(nibName: identifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.className)
    }

    func register<T: UICollectionReusableView>(footer: T.Type) {
        register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.className)
    }

    func dequeue<T: UICollectionReusableView>(_ name: T.Type, ofKind kind: String, for indexPath: IndexPath) -> T {
        guard let view = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.className, for: indexPath) as? T else {
            fatalError(
                "Couldn't find UICollectionViewCell for \(String(describing: name)), make sure the cell is registered with collection view")
        }
        return view
    }

    func centerItemsInCollectionView(cellWidth: Double, numberOfItems: Double, spaceBetweenCell: Double) {
        let totalWidth = cellWidth * numberOfItems
        let totalSpacingWidth = spaceBetweenCell * (numberOfItems - 1)
        let leftInset = (self.frame.width - CGFloat(totalWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset
        self.contentInset = UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
}

extension UICollectionView {
    var visibleIndexPath: IndexPath {
        let visibleRect = CGRect(origin: contentOffset, size: bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        let visibleIndexPath = indexPathForItem(at: visiblePoint)
        return visibleIndexPath ?? IndexPath(item: 0, section: 0)
    }
}

public extension IndexPath {
    func isLastRow(at collectionView: UICollectionView) -> Bool {
        row == (collectionView.numberOfItems(inSection: section) - 1)
    }
}

