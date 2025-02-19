//
//  MainCell.swift
//  OpenMarket
//
//  Created by kjs on 2021/08/26.
//

import UIKit

class MainCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var originalPriceLabel: UILabel!
    @IBOutlet weak var discountedPriceLabel: UILabel!
    @IBOutlet weak var remainedStockLabel: UILabel!
    
    private let stockPrefix = "잔여수량 : "
    private let space = " "
    private let errorImageName = "clear"
    private let accessibilityPrefixOfDiscountedPrice = "할인 중 : "
    private var currentItem: Goods? = nil
    
    private weak var formatter: NumberFormatter?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layerStyling()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layerStyling()
    }
    
    func configure(withItem item: Goods, formatter: NumberFormatter) {
        currentItem = item
        
        self.formatter = formatter
    }
    
    func show(at collectionView: UICollectionView, withIdentifer indexPath: IndexPath) {
        guard let item = currentItem else {
            return
        }
        
        drawImage(collectionView, with: item.thumbnailURLs.first, identifer: indexPath)
        titleLabel.text = item.title
        configureOriginalPirceLabel(with: item)
        configureDiscountedPirceLabel(with: item)
        configureStockLabel(with: item)
    }
    
    private func configureDiscountedPirceLabel(with item: Goods) {
        let pricePrefix = item.currency + space
        let priceDescription = formatted(price: item.discountedPrice, WithCurrency: pricePrefix)
        
        discountedPriceLabel.text = priceDescription
        discountedPriceLabel.accessibilityValue = priceDescription
        
        if item.discountedPrice != nil {
            discountedPriceLabel.isAccessibilityElement = true
            discountedPriceLabel.accessibilityLabel = accessibilityPrefixOfDiscountedPrice
        } else {
            discountedPriceLabel.isAccessibilityElement = false
        }
    }
    
    private func configureOriginalPirceLabel(with item: Goods) {
        originalPriceLabel.attributedText = nil
        
        let pricePrefix = item.currency + space
        let priceDescription = formatted(price: item.price, WithCurrency: pricePrefix)
        
        originalPriceLabel.text = priceDescription
        originalPriceLabel.accessibilityLabel = priceDescription
        
        if item.discountedPrice != nil,
           let priceDescription = priceDescription {
            originalPriceLabel.isAccessibilityElement = false
            
            let styledText = NSMutableAttributedString(string: priceDescription)
            let range = NSRange(location: 0, length: priceDescription.count)
            
            styledText.addAttribute(
                .strikethroughStyle,
                value: 1,
                range: range
            )
            styledText.addAttribute(
                .foregroundColor,
                value: UIColor.red,
                range: range
            )
            
            originalPriceLabel.attributedText = styledText
            
        } else {
            originalPriceLabel.isAccessibilityElement = true
        }
    }
    
    private func formatted(price: Int?, WithCurrency prefix: String?) -> String? {
        guard let formatter = formatter,
              let price = price else {
            return nil
        }
        
        let description = formatter.toDecimalString(from: price)
        
        if let prefix = prefix {
            return prefix + description
        } else {
            return description
        }
    }
    
    private func configureStockLabel(with item: Goods) {
        remainedStockLabel.attributedText = nil
        
        if item.stock == 0 {
            let text = "품절"
            let styledText = NSMutableAttributedString(string: text)
            let range = NSRange(location: 0, length: text.count)
            styledText.addAttribute(
                .foregroundColor,
                value: UIColor.orange,
                range: range
            )
            remainedStockLabel.text = text
            remainedStockLabel.attributedText = styledText
        } else {
            remainedStockLabel.text = stockPrefix + item.stock.description
        }
    }
    
    private func drawImage(_ collectinView: UICollectionView, with path: String?, identifer index: IndexPath) {
        imageView.image = nil
        
        guard let path = path else {
            return
        }
        
        do {
            try NetworkManager.shared.getAnImage(with: path) { [weak self] result in
                switch result {
                case .success(let data):
                    let imageData = UIImage(data: data)
                    DispatchQueue.main.async {
                        guard let it = self,
                              index == collectinView.indexPath(for: it) else {
                            return
                        }
                        
                        self?.imageView.image = imageData
                    }
                case .failure:
                    self?.drawErrorImage()
                }
            }
        } catch {
            drawErrorImage()
        }
    }
    
    private func drawErrorImage() {
        let imageData = UIImage(systemName: self.errorImageName)
        DispatchQueue.main.async {
            self.imageView.image = imageData
        }
    }
    
    private func layerStyling() {
        layer.cornerRadius = 12
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 1
    }
}
