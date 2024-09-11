//
//  CityCollectionCell.swift
//  PlacesCatalogUIKit
//
//  Created by Shrinivas Kalshetty on 11/09/24.
//

import UIKit

class CityCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    static let identifier = "CityCollectionCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    private func setupUI() {
        imgView.layer.cornerRadius = 8
        imgView.layer.masksToBounds = true
    }
    
    func setData(headerImgStr: String) {
        if let image = UIImage(named: headerImgStr) {
            imgView.image = image
        }
    }
}
