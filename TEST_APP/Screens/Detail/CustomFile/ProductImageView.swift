//
//  ProductImageView.swift
//  TEST_APP
//
//  Created by Quoc Huynh on 22/7/24.
//

import UIKit

class ProductImageView: UIView {
    @IBOutlet private weak var productName: UILabel!
    @IBOutlet private weak var bigImageCollectionView: UICollectionView!
    @IBOutlet private weak var listImageCollectionView: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!
    private var currentPageIndex: Int = 0
    private var producData: Product?

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

    func updateUI(producData: Product) {
        self.producData = producData
        pageControl.numberOfPages = producData.images.count
        pageControl.currentPage = 0
        productName.text = producData.name
        listImageCollectionView.reloadData()
        bigImageCollectionView.reloadData()
        updateCurrentPageIndex(0)
        bigImageCollectionView.scrollToItem(at: IndexPath(row: 0, section: 0),
                                            at: .centeredHorizontally,
                                            animated: true)
        
        updateContentInset(item: producData.images.count)
    }

    private func updateContentInset(item: Int) {
        let widthCollectionView = UIScreen.main.bounds.width - (DeviceUtility.isIpad() ? 120 : 32)
        let contentWidth = CGFloat(item * 100)
        let contentWidthIsShoter = contentWidth < widthCollectionView
        if  contentWidthIsShoter {
            let offset = (widthCollectionView - contentWidth) / 2
            listImageCollectionView.contentInset = .init(top: 0,
                                                left: contentWidthIsShoter ? offset : 0,
                                                bottom: 0,
                                                right: contentWidthIsShoter ? offset : 0)
        }
    }

    private func setupUI() {
        listImageCollectionView.register(ImageCVCell.self)
        listImageCollectionView.delegate = self
        listImageCollectionView.dataSource = self
        bigImageCollectionView.register(BigImageCVCell.self)
        bigImageCollectionView.delegate = self
        bigImageCollectionView.dataSource = self
        pageControl.numberOfPages = producData?.images.count ?? 0
        pageControl.currentPageIndicatorTintColor = .brown
    }
}

extension ProductImageView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
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

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == listImageCollectionView {
            (collectionView.cellForItem(at: indexPath) as? ImageCVCell)?.updateUI()
        }
    }

    private func updateCurrentPageIndex(_ index: Int) {
        currentPageIndex = index
        pageControl.currentPage = index
        (listImageCollectionView.cellForItem(at: IndexPath(item: index, section: 0)) as? ImageCVCell)?.updateUI()
        listImageCollectionView.reloadData()
        listImageCollectionView.selectItem(at: IndexPath(row: index, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
}

extension ProductImageView: UICollectionViewDataSource, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        producData?.images.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let producData else { return UICollectionViewCell() }
        if listImageCollectionView == collectionView {
            let cell = collectionView.dequeue(ImageCVCell.self, for: indexPath)
            cell.configView(product: producData, index: indexPath.row)
            return cell
        } else {
            let cell = collectionView.dequeue(BigImageCVCell.self, for: indexPath)
            cell.configView(product: producData, index: indexPath.row)
            return cell
        }
    }
}
