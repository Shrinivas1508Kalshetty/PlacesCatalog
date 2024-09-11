//
//  CitiesViewController+Extension.swift
//  PlacesCatalogUIKit
//
//  Created by Shrinivas Kalshetty on 11/09/24.
//

import UIKit

extension CitiesViewController: CitiesViewModelDelegate {
    func didFinishWithCityLoading() {
        reloadTable()
    }
    
    func didFailedWithCityLoading() {
        reloadTable()
    }
}

extension CitiesViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchBar.resignFirstResponder()
    }
}
