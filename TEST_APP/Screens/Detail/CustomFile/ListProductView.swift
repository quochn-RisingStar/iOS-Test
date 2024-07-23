//
//  ListProductView.swift
//  TEST_APP
//
//  Created by Quoc Huynh on 23/7/24.
//

import UIKit

class ListProductView: UIView {
    @IBOutlet private weak var topView: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!

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
    }
}

extension ListProductView: UICollectionViewDataSource, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let image = ["delete", "heart", "iPhone"].randomElement() ?? "iPhone"
            let cell = collectionView.dequeue(ProductCVCell.self, for: indexPath)
            cell.configView(product: .init(name: "gia", image: image, price: "16.00$"))
            return cell
    }
}


