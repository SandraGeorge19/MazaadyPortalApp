//
//  ProductCollectionViewCell.swift
//  MazaadyPortal
//
//  Created by Sandra George on 26/04/2025.
//

import UIKit
import SDWebImage

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var priceTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var offerPriceView: OfferPriceView!
    @IBOutlet weak var countDownView: CountDownView!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 20
        containerView.clipsToBounds = true
    }
    
    func configure(with product: Product?) {
        setupProductImage(imageUrl: product?.image ?? "")
        setupProductTitle(title: product?.name ?? "")
        setupPriceTitle(title: "Price")
        setupProductPrice(price: product?.price ?? 0, currency: product?.currency ?? "")
        setupOfferPrice(product: product)
        setupCountDown(endDate: product?.endDate)
    }
    
    private func setupProductImage(imageUrl: String) {
        productImage.sd_setImage(
            with: URL(string: imageUrl),
            placeholderImage: UIImage(named: "user_placeholder"),
            context: nil
        )
        productImage.layer.cornerRadius = 20
        productImage.clipsToBounds = true
    }
    
    private func setupProductTitle(title: String) {
        productTitle.text = title
        productTitle.font = UIFont.nunitoFont(size: 14, weight: .meduim)
        productTitle.textColor = .black
    }
    
    private func setupPriceTitle(title: String) {
        priceTitle.text = title
        priceTitle.font = UIFont.nunitoFont(size: 12, weight: .meduim)
        priceTitle.textColor = UIColor(hex: "#333333")
    }
    
    private func setupProductPrice(price: Int, currency: String) {
        productPrice.text = "\(price) \(currency)"
        productPrice.font = UIFont.nunitoFont(size: 14, weight: .bold)
        productPrice.textColor = .black
    }
    
    private func setupOfferPrice(product: Product?) {
        if let offerPrice = product?.offer {
            offerPriceView.isHidden = false
            offerPriceView.setupViews(originalPrice: product?.price ?? 0, offerPrice: offerPrice, currency: product?.currency ?? "")
        } else {
            offerPriceView.isHidden = true
        }
    }
    
    private func setupCountDown(endDate: Double?) {
        if let endDate = endDate {
            countDownView.isHidden = false
            countDownView.configure(withEndTimeInterval: endDate)
        } else {
            countDownView.isHidden = true
        }
    }
}
