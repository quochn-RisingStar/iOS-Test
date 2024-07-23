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
    @IBOutlet private weak var topView: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    weak var delegate: ListProductViewDelegate?
    private var lisProduct: [Product] = []

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
        self.lisProduct = listProduct
        collectionView.reloadData()
    }

    func setupUI() {
        collectionView.register(ProductCVCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
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
        lisProduct.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(ProductCVCell.self, for: indexPath)
        cell.configView(product: lisProduct[indexPath.row])
        return cell
    }
}


