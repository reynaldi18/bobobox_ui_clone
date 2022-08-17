//
//  UpdateCollectionViewCell.swift
//  Bobobox Clone
//
//  Created by Reynaldi Pamungkas on 11/08/22.
//

import UIKit

class UpdateCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var updateImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class var reuseIdentifier: String {
        return  "CollectionViewCellReuseIdentifier"
    }
    
    class var nibName: String {
        return "UpdateCollectionViewCell"
    }
    func setupUI(name: String) {
        updateImageView.image = UIImage(named: name)
    }

}
