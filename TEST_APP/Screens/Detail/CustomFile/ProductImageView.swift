//
//  ProductImageView.swift
//  TEST_APP
//
//  Created by Quoc Huynh on 22/7/24.
//

import UIKit

class ProductImageView: UIView {
    @IBOutlet private weak var topView: UILabel!
    @IBOutlet private weak var bigImageCollectionView: UICollectionView!
    @IBOutlet private weak var listImageCollectionView: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!
    private var currentPageIndex: Int = 0

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
        listImageCollectionView.register(ImageCVCell.self)
        listImageCollectionView.delegate = self
        listImageCollectionView.dataSource = self
        bigImageCollectionView.register(BigImageCVCell.self)
        bigImageCollectionView.delegate = self
        bigImageCollectionView.dataSource = self
        pageControl.numberOfPages = 5
        pageControl.currentPageIndicatorTintColor = .brown
    }
}

extension ProductImageView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if listImageCollectionView == collectionView {
            return .init(width: 100, height: 60)
        } else {
            return collectionView.frame.size
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == listImageCollectionView {
            bigImageCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        } else {
            listImageCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        updateCurrentPageIndex(indexPath.row)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == bigImageCollectionView {
            let index = Int(scrollView.contentOffset.x / scrollView.frame.width)
            updateCurrentPageIndex(index)
        }
    }

    private func updateCurrentPageIndex(_ index: Int) {
        currentPageIndex = index
        pageControl.currentPage = index
        listImageCollectionView.reloadData()
        listImageCollectionView.selectItem(at: IndexPath(row: index, section: 0), animated: true, scrollPosition: .centeredHorizontally)
        (listImageCollectionView.cellForItem(at: IndexPath(row: index, section: 0)) as? ImageCVCell)?.updateUI()
    }
    
}

extension ProductImageView: UICollectionViewDataSource, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if listImageCollectionView == collectionView {
            let image = ["delete", "heart", "iPhone"].randomElement() ?? "iPhone"
            let cell = collectionView.dequeue(ImageCVCell.self, for: indexPath)
            cell.configView(product: .init(name: "gia", image: image, price: "16.00$"))
            return cell
        } else {
            let image = ["delete", "heart", "iPhone"].randomElement() ?? "iPhone"
            let cell = collectionView.dequeue(BigImageCVCell.self, for: indexPath)
             cell.configView(product: .init(name: "gia", image: image, price: "16.00$"))
            return cell
        }
    }
}
