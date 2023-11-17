//
//  BitCoinTableViewCell.swift
//  bitcoin
//
//  Created by Preeti Kesarwani on 11/16/23.
//

import UIKit

class BitCoinTableViewCell: UITableViewCell {
    
    @IBOutlet var currency: UILabel!
    
    
    @IBOutlet var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
    }
    
    public var item : BitCoinModel! {
        didSet {
            currency.text = item.currency
            price.text = item.price
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
