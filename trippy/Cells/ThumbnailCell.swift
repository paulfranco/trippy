//
//  ThumbnailCell.swift
//  trippy
//
//  Created by Paul Franco on 9/9/20.
//

import UIKit
import SDWebImage

class ThumbnailCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    
    func configureCell(url: String) {
        img.layer.cornerRadius = 5
        guard let url = URL(string: url) else { return }
        img.sd_imageIndicator = SDWebImageActivityIndicator.medium
        img.sd_setImage(with: url, placeholderImage: UIImage(named: ImageName.placeholderImage))
    }
    
}
