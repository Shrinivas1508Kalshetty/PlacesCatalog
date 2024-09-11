//
//  PlaceTableCell.swift
//  PlacesCatalogUIKit
//
//  Created by Shrinivas Kalshetty on 11/09/24.
//

import UIKit

class PlaceTableCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var detailLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var backView: UIView!
    
    static let identifier = "PlaceTableCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupUI() {
        nameLbl.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        detailLbl.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        backView.addShadow()
        imgView.layer.cornerRadius = 5
        backView.layer.cornerRadius = 5
        backView.layer.masksToBounds = false
    }
    
    func setupData(item: Places) {
        nameLbl.text = item.placeName
        detailLbl.text = item.detail
        if let image = UIImage(named: item.image) {
            imgView.image = image
        }
    }
}
