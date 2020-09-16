//
//  VacationDetailsVC.swift
//  trippy
//
//  Created by Paul Franco on 9/9/20.
//

import UIKit
import SDWebImage

class VacationDetailsVC: UIViewController {
    
    @IBOutlet weak var activitiesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var numberOfNights: UILabel!
    @IBOutlet weak var airfareLabel: UILabel!
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var vacation: Vacation!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setMainImage(index: 0)
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self    }
    
    func setMainImage(index: Int) {
        let imageUrl = vacation.images[index]
        if let url = URL(string: imageUrl) {
            mainImage.layer.cornerRadius = 10
            mainImage.sd_imageIndicator = SDWebImageActivityIndicator.medium
            mainImage.sd_setImage(with: url, placeholderImage: UIImage(named: ImageName.placeholderImage))
        }
        
    }
    
    func setupUI() {
        title = vacation.title
        activitiesLabel.text = vacation.activities
        descriptionLabel.text = vacation.description
        
        priceLabel.text = "All inclusive price: " + vacation.price.formatToCurrencyString()
        numberOfNights.text = "\(vacation.numberOfNights) night accomodations"
        airfareLabel.text = vacation.airfare    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let checkoutVC = segue.destination as? CheckoutVC {
            checkoutVC.vacation = self.vacation
        }
    }

}

extension VacationDetailsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vacation.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellId.ThumbnailCell, for: indexPath) as! ThumbnailCell
        let url = vacation.images[indexPath.row]
        cell.configureCell(url: url)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        setMainImage(index: indexPath.item)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
    
}
