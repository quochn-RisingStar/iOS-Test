//
//  BigImageCVCell.swift
//   TEST_APP
//
//  Created by Quoc Huynh on 22/7/24.
//

import UIKit

class BigImageCVCell: UICollectionViewCell {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var labelView: UIView!
    @IBOutlet private weak var priceToplabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configView(product: Product) {
//        imageView.image = UIImage(named: product.image)
        priceToplabel.text = product.price
        imageView.updateCornerRadius(14)
        labelView.updateCornerRadius(10)
        labelView.layer.borderColor = UIColor.white.cgColor
        labelView.layer.borderWidth = 1
    }

    func updateUI() {
        layer.borderWidth = 2.0
        layer.borderColor = isSelected ? UIColor.clear.cgColor : UIColor.yellow.cgColor
    }
}

