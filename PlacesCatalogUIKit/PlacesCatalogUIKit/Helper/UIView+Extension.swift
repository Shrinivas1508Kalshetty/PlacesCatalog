//
//  UIView+Extension.swift
//  PlacesCatalogUIKit
//
//  Created by Shrinivas Kalshetty on 11/09/24.
//

import UIKit
extension UIView {
    func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
                   shadowOpacity: Float = 0.2,
                   shadowOffset: CGSize = CGSize(width: 0, height: 2),
                   shadowRadius: CGFloat = 5)
    {
        layer.shadowColor = shadowColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
    }
}
