//
//  UIView.swift
//  TEST_APP
//
//  Created by Quoc Huynh on 22/7/24.
//

import UIKit

extension UIView {
    func nibInit() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView ?? UIView()
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    func updateCornerRadius(_ cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        layoutIfNeeded()
    }
}
