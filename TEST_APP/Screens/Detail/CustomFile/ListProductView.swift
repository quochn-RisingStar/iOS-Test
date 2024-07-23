//
//  ListProductView.swift
//  TEST_APP
//
//  Created by Quoc Huynh on 23/7/24.
//

import UIKit

protocol ListProductViewDelegate: AnyObject {
    func didTapProductAt(_ index: Int)
}

class ListProductView: UIView {
    @IBOutlet private weak var producLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    weak var delegate: ListProductViewDelegate?
    private var listProduct: [Product] = []

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibInit()
        setupUI()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        nibInit()
        setupUI()
    }

    func updateUI(listProduct: [Product]) {
        self.listProduct = listProduct
        collectionView.reloadData()
        updateContentInset(item: listProduct.count)
    }

    func reloadView() {
        collectionView.reloadData()
        updateContentInset(item: listProduct.count)
    }

    private func setupUI() {
        collectionView.register(ProductCVCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    private func updateContentInset(item: Int) {
        let widthCollectionView = UIScreen.main.bounds.width - (DeviceUtility.isIpad() ? 120 : 32)
        let contentWidth = CGFloat(item * 220)
        let contentWidthIsShoter = contentWidth < widthCollectionView
        if  contentWidthIsShoter {
            let offset = (widthCollectionView - contentWidth) / 2
            collectionView.contentInset = .init(top: 0,
                                                left: contentWidthIsShoter ? offset : 0,
                                                bottom: 0,
                                                right: contentWidthIsShoter ? offset : 0)
        }
    }
}

extension ListProductView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 220, height: 180)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didTapProductAt(indexPath.row)
    }
}

extension ListProductView: UICollectionViewDataSource, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        listProduct.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(ProductCVCell.self, for: indexPath)
        cell.configView(product: listProduct[indexPath.row])
        return cell
    }
}


