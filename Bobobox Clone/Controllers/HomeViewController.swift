//
//  HomeViewController.swift
//  Bobobox Clone
//
//  Created by Reynaldi Pamungkas on 10/08/22.
//

import UIKit
class HomeViewController: BaseViewController {
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var promoCollectionView: UICollectionView!
    @IBOutlet weak var updateCollectionView: UICollectionView!
    
    var listPromo = [
        "promo_1",
        "promo_2",
        "promo_3",
        "promo_4"
    ]
    
    var listUpdate = [
        "logo_text"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        promoCollectionView.delegate = self
        promoCollectionView.dataSource = self
        updateCollectionView.delegate = self
        updateCollectionView.dataSource = self
        setupUI()
        registerPromoNIB()
        registerUpdateNIB()
    }
    
    func setupUI() {
        promoCollectionView.contentInset = UIEdgeInsets(
            top: 0,
            left: 16,
            bottom: 0,
            right: 16
        )
        updateCollectionView.contentInset = UIEdgeInsets(
            top: 0,
            left: 16,
            bottom: 0,
            right: 16
        )
        headerView.cornerRadius = 16
        headerView.layer.masksToBounds = true
        headerView.layer.maskedCorners = [
            .layerMinXMaxYCorner,
            .layerMaxXMaxYCorner
        ]
    }
    func registerPromoNIB() {
        let nib = UINib(nibName: PromoCollectionViewCell.nibName, bundle: nil)
        promoCollectionView?.register(nib, forCellWithReuseIdentifier:PromoCollectionViewCell.reuseIdentifier)
        if let flowLayout = self.promoCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }
    func registerUpdateNIB() {
        let nib = UINib(nibName: UpdateCollectionViewCell.nibName, bundle: nil)
        updateCollectionView?.register(nib, forCellWithReuseIdentifier:UpdateCollectionViewCell.reuseIdentifier)
        if let flowLayout = self.updateCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }
}

extension HomeViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.promoCollectionView {
            guard let cell: PromoCollectionViewCell = Bundle.main.loadNibNamed(
                PromoCollectionViewCell.nibName,
                owner: self,
                options: nil
            )?.first as? PromoCollectionViewCell else {
                return CGSize.zero
            }
            let size: CGSize = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
            return CGSize(width: size.width, height: 140)
        } else {
            guard let cell: UpdateCollectionViewCell = Bundle.main.loadNibNamed(
                UpdateCollectionViewCell.nibName,
                owner: self,
                options: nil
            )?.first as? UpdateCollectionViewCell else {
                return CGSize.zero
            }
            let size: CGSize = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
            return CGSize(width: size.width, height: 140)
        }
    }
}

extension HomeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.promoCollectionView {
            return listPromo.count
        } else {
            return listUpdate.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.promoCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromoCollectionViewCell.reuseIdentifier,for: indexPath) as? PromoCollectionViewCell {
                let promo = listPromo[indexPath.row]
                cell.setupUI(name: promo)
                return cell
            }
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpdateCollectionViewCell.reuseIdentifier,for: indexPath) as? UpdateCollectionViewCell {
                let update = listUpdate[indexPath.row]
                cell.setupUI(name: update)
                return cell
            }
        }
        return UICollectionViewCell()
    }
}

