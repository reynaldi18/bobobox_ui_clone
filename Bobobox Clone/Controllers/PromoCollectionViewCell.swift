//
//  PromoCollectionViewCell.swift
//  Bobobox Clone
//
//  Created by Reynaldi Pamungkas on 11/08/22.
//

import UIKit

class PromoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var promoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class var reuseIdentifier: String {
        return  "CollectionViewCellReuseIdentifier"
    }
    
    class var nibName: String {
        return "PromoCollectionViewCell"
    }
    func setupUI(name: String) {
        promoImageView.image = UIImage(named: name)
    }

}
