//
//  ImageCVCell.swift
//   TEST_APP
//
//  Created by Quoc Huynh on 22/7/24.
//

import UIKit

class ProductCVCell: UICollectionViewCell {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var labelView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }

    func setUpUI() {
       
    }

    func configView(product: Product) {
        priceLabel.text = product.price
        nameLabel.text = product.name
        imageView.image = product.images.first
        imageView.updateCornerRadius(14)
        labelView.updateCornerRadius(13)
        labelView.layer.borderColor = UIColor.white.cgColor
        labelView.layer.borderWidth = 2
    }

    func updateUI() {
        layer.borderWidth = 2.0
        layer.borderColor = isSelected ? UIColor.clear.cgColor : UIColor.yellow.cgColor
    }
}
