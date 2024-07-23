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
        imageView.updateCornerRadius(14)
        labelView.updateCornerRadius(10)
        labelView.layer.borderColor = UIColor.white.cgColor
        labelView.layer.borderWidth = 1
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.gray.cgColor
    }

    func configView(product: Product, index: Int) {
        imageView.image = product.images[index]
        priceToplabel.text = product.price

    }
}

