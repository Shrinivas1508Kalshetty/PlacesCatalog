//
//  CitiesViewController+DataSourceDelegate.swift
//  PlacesCatalogUIKit
//
//  Created by Shrinivas Kalshetty on 11/09/24.
//


import Foundation
import UIKit

//MARK: Search bar delegate
extension CitiesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        debouncer.debounce { [weak self] in
                self?.viewModel.searchText(searchText)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension CitiesViewController: UITableViewDataSource, UITableViewDelegate {
    func setTableViewHeader() {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableCell.identifier) as? HeaderTableCell else { return }

        cell.setupData(Cities: viewModel.cities)
        cell.delegate = self
        cell.frame.size.width = UIScreen.main.bounds.width - 10
        cell.frame.size.height = UIScreen.main.bounds.width * 0.70

           let headerView = UIView(frame: cell.frame)
           headerView.addSubview(cell)
           tableView.tableHeaderView = headerView
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel.itemList.isEmpty ? 1 : viewModel.itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if !viewModel.itemList.isEmpty &&
                    viewModel.itemList.count > indexPath.row {
            //For item list
            let cell = tableView.dequeueReusableCell(withIdentifier: PlaceTableCell.identifier) as? PlaceTableCell
            
            let cellData = viewModel.itemList[indexPath.row]
            cell?.setupData(item: cellData)
            return cell ?? UITableViewCell()
        }
        
        let defaultCell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        defaultCell.separatorInset = .zero
        defaultCell.selectionStyle = .none
        defaultCell.textLabel?.textAlignment = .center
        defaultCell.textLabel?.text = Constants.noDataFound
        return defaultCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            return searchBar
    }
}

extension CitiesViewController: HeaderTableCellDelegate {
    func categoryDidChanged(category: CitiesListData) {
        searchBar.text?.removeAll()
        viewModel.loadDataAsPerCategoryName(category.cityName)
    }
}

