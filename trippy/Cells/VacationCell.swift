//
//  VacationCell.swift
//  trippy
//
//  Created by Paul Franco on 9/9/20.
//

import UIKit
import SDWebImage

class VacationCell: UITableViewCell {
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 1.0
        layer.shadowOffset = CGSize.zero
    }

    func configureCell(vacation: Vacation) {
        titleLabel.text = vacation.title
        priceLabel.text = "\(vacation.price)"
        
        let imageUrl = vacation.images[0]
        if let url = URL(string: imageUrl) {
            mainImage.sd_imageIndicator = SDWebImageActivityIndicator.medium
            mainImage.sd_setImage(with: url, placeholderImage: UIImage(named: "background-beach-alpha"))
        }
        
    }
    
}
