//
//  DetailProductVC.swift
//  TEST_APP
//
//  Created by Quoc Huynh on 22/7/24.
//

import UIKit

class DetailProductVC: UIViewController {
    @IBOutlet weak var showMoreView: ShowMoreView!
    @IBOutlet weak var productImageView: ProductImageView!
    @IBOutlet weak var listProductView: ListProductView!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var showMoreHeightcontraint: NSLayoutConstraint!
    @IBOutlet weak var ratioContraint: NSLayoutConstraint!
    @IBOutlet weak var ratioBottomContraint: NSLayoutConstraint!
    let viewModel = DetailProductViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        showMoreView.delegate = self
        buyButton.updateCornerRadius(16)
        listProductView.delegate = self
        listProductView.updateUI(listProduct: viewModel.lisProductData)
    }

    override func viewDidAppear(_ animated: Bool) {
        didTapProductAt(0)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
           super.viewWillTransition(to: size, with: coordinator)

           coordinator.animate(alongsideTransition: { [weak self] (context) in
               // Update ratio based on new size
               self?.updateRatioConstraint(for: size)
               self?.view.layoutIfNeeded()
           }, completion: nil)
       }

       func updateRatioConstraint(for size: CGSize) {
           if size.width > size.height {
               let newRatio = 340 / 812.0
               ratioContraint.constant = 2 / 3 * size.height
               ratioBottomContraint.constant = 230.0 / 812.0 * size.height
           } else {
               // Portrait orientation
               let newRatio = 812.0 / 340
               ratioContraint.constant = 340 / 812.0
               ratioBottomContraint.constant = 230.0 / 812.0
           }
       }
}

extension DetailProductVC: ShowMoreViewDelegate {
    func didTapSeeMore(curentHeight: Double) {
        showMoreHeightcontraint.constant = curentHeight
    }
}

extension DetailProductVC: ListProductViewDelegate {
    func didTapProductAt(_ index: Int) {
        showMoreView.updateUI(listOffer: viewModel.lisProductData[index].offers)
        productImageView.updateUI(producData: viewModel.lisProductData[index])
    }
}

private extension DetailProductVC {
}
