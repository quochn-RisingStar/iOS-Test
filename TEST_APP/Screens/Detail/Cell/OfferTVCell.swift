//
//  OfferTVCell.swift
//  TEST_APP
//
//  Created by Quoc Huynh on 23/7/24.
//

import UIKit

class OfferTVCell: UITableViewCell {
    @IBOutlet private weak var detailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func config(offer: String) {
        detailLabel.text = offer
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
