//
//  DetailProductVC.swift
//  TravelBoast
//
//  Created by Nitrotech Asia on 05/06/2024.
//

import UIKit

class DetailProductVC: UIViewController {
    @IBOutlet weak var showMoreView: ShowMoreView!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var showMoreHeightcontraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        showMoreView.delegate = self
        buyButton.updateCornerRadius(8)
        title = "some title"
    }
}

extension DetailProductVC: ShowMoreViewDelegate {
    func didTapSeeMore(curentHeight: Double) {
        showMoreHeightcontraint.constant = curentHeight
    }
}

private extension DetailProductVC {

}
