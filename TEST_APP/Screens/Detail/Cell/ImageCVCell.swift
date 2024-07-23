//
//  ImageCVCell.swift
//  TEST_APP
//
//  Created by Quoc Huynh on 22/7/24.
//

import UIKit

class ImageCVCell: UICollectionViewCell {
    @IBOutlet private weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }

    func setUpUI() {
        updateCornerRadius(6)
    }

    func configView(product: Product) {
    }

    func updateUI() {
        layer.borderWidth = 2.0
        layer.borderColor = isSelected ? UIColor.red.cgColor : UIColor.clear.cgColor
    }
}

enum TypeCell {
    case bigCell, smallCell, ProductCell
}

struct Product {
    var name: String
    var image: String
    var price: String
}
