//
//  DetailProductVC.swift
//  TEST_APP
//
//  Created by Quoc Huynh on 22/7/24.
//

import UIKit

class DetailProductVC: UIViewController {
    @IBOutlet weak private var showMoreView: ShowMoreView!
    @IBOutlet weak private var productImageView: ProductImageView!
    @IBOutlet weak private var listProductView: ListProductView!
    @IBOutlet weak private var buyButton: UIButton!
    @IBOutlet weak private var showMoreHeightcontraint: NSLayoutConstraint!
    @IBOutlet weak private var ratioContraint: NSLayoutConstraint!
    @IBOutlet weak private var widthScrollView: NSLayoutConstraint!
    @IBOutlet weak private var leadingScrollViewConstraint: NSLayoutConstraint!
    @IBOutlet weak private var trailingScrollViewConstraint: NSLayoutConstraint!
    @IBOutlet weak private var descTitleLabel: UILabel!
    @IBOutlet weak private var descLabel: UILabel!
    let viewModel = DetailProductViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        updateScrollViewPadding()
        didTapProductAt(0)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { [weak self] (context) in
            self?.updateRatioConstraint(for: size)
            self?.view.layoutIfNeeded()
        }, completion: { [weak self] _ in
            self?.didTapProductAt(0)
            self?.listProductView.reloadView()
        })
    }
}

extension DetailProductVC: ShowMoreViewDelegate {
    func didTapSeeMore(curentHeight: Double) {
        showMoreHeightcontraint.constant = curentHeight
        view.layoutSubviews()
    }
}

extension DetailProductVC: ListProductViewDelegate {
    func didTapProductAt(_ index: Int) {
        showMoreView.updateUI(listOffer: viewModel.lisProductData[index].offers)
        productImageView.updateUI(producData: viewModel.lisProductData[index])
    }
}

private extension DetailProductVC {
    func setupUI() {
        showMoreView.delegate = self
        buyButton.updateCornerRadius(16)
        listProductView.delegate = self
        listProductView.updateUI(listProduct: viewModel.lisProductData)
    }

    func updateRatioConstraint(for size: CGSize) {
        if size.width > size.height {
            ratioContraint.constant = 180 / 375 * size.height - 70
        } else {
            ratioContraint.constant = 180 / 375 + 144
        }
    }

    func updateScrollViewPadding() {
        let padding: CGFloat = DeviceUtility.isIpad() ? 60 : 0
        leadingScrollViewConstraint.constant = padding
        trailingScrollViewConstraint.constant = -padding
        view.layoutIfNeeded()
    }
}
