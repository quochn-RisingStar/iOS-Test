//
//  ShowMoreView.swift
//  TEST_APP
//
//  Created by Quoc Huynh on 22/7/24.
//

import Foundation
import UIKit

protocol ShowMoreViewDelegate: AnyObject {
    func didTapSeeMore(curentHeight: Double)
}

class ShowMoreView: UIView {
    @IBOutlet private weak var imageArrow: UIImageView!
    @IBOutlet private weak var topView: UIView!
    @IBOutlet private weak var tabelView: UITableView!
    @IBOutlet private weak var seeMoreButton: UIButton!
    weak var delegate: ShowMoreViewDelegate?
    private var isShowMore = false

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

    func setupUI() {
        tabelView.register(OfferTVCell.self)
        tabelView.delegate = self
        tabelView.dataSource = self
        imageArrow.transform = .init(rotationAngle: isShowMore ? 0 : CGFloat.pi)
        tabelView.isHidden = true
    }

    @IBAction private func didTapSeeMore(_ sender: Any) {
        isShowMore.toggle()
        seeMoreButton.setTitle(isShowMore ? "See Less" : "Show More", for: .normal)
        imageArrow.transform = .init(rotationAngle: isShowMore ? 0 : CGFloat.pi)
        tabelView.isHidden = !isShowMore
        delegate?.didTapSeeMore(curentHeight: isShowMore ? (tabelView.contentSize.height + 28.0) : 20)
    }
}

extension ShowMoreView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension ShowMoreView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeue(OfferTVCell.self, for: indexPath)
    }
}
