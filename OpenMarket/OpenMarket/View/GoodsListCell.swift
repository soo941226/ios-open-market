//
//  GoodsListCell.swift
//  OpenMarket
//
//  Created by kjs on 2021/08/25.
//

import UIKit

class GoodsListCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var discountedLabel: UILabel!
    @IBOutlet weak var stockLabel: UILabel!
    
    func configure(item: Goods) {
        titleLabel.text = item.title
        priceLabel.text = item.price.description
        discountedLabel.text = item.discountedPrice?.description
        stockLabel.text = item.stock.description
    }
}
