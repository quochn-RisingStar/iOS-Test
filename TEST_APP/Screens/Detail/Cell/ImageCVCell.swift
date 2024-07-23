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

    func configView(product: Product, index: Int) {
        imageView.image = product.images[index]
    }

    func updateUI() {
        layer.borderWidth = 2.0
        layer.borderColor = isSelected ? UIColor.yellow.cgColor : UIColor.clear.cgColor
    }
}

enum TypeCell {
    case bigCell, smallCell, ProductCell
}

struct Product {
    var name: String
    var images: [UIImage] = []
    var price: String
    var desc: String?
    var offers: [String] = []
}
