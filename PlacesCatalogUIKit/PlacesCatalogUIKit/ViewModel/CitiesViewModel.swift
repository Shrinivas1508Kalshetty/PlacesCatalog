//
//  CitiesViewModel.swift
//  PlacesCatalogUIKit
//
//  Created by Shrinivas Kalshetty on 11/09/24.
//

import Foundation

protocol CitiesViewModelDelegate: AnyObject {
    func didFinishWithCityLoading()
    func didFailedWithCityLoading()
}

final class CitiesViewModel {
    var cities = [CitiesListData]()
    private var filterPlaces = [Places]()
    var itemList: [Places] {
        return filterPlaces
    }
    
    private var selectedCategory: CitiesListData?
    weak var delegate: CitiesViewModelDelegate?
     
    private var fileReader: FileReader
    
    init(fileReader: FileReader = FileReader()) {
        self.fileReader = fileReader
    }
    
    func loadData() {
        guard let categoryData = fileReader.getCityData(fileName: "CitiesData") else {
            refreshList()
            return
        }
        cities = categoryData.cities
        selectedCategory = cities.first
        refreshList()
    }

    func searchText(_ searchText: String) {
        if searchText.isEmpty {
            refreshList(isSearching: true)
        } else {
            filterPlaces = selectedCategory?.visitingPlaces.filter { model in
                return model.placeName.lowercased().range(of: searchText.lowercased()) != nil
            } ?? []
            manageData(isSearching: true)
        }
    }
    
    func loadDataAsPerCategoryName(_ name: String) {
        selectedCategory = cities.filter({$0.cityName == name}).first
        refreshList()
    }
    
    func clearSearch(){
        refreshList()
    }
    
    private func refreshList(isSearching: Bool = false) {
        filterPlaces = selectedCategory?.visitingPlaces ?? []
        manageData(isSearching: isSearching)
    }
    
    private func manageData(isSearching: Bool = false) {
        if filterPlaces.isEmpty {
            if isSearching {
                delegate?.didFailedWithCityLoading()
            } else {
                delegate?.didFailedWithCityLoading()
            }
        } else {
            delegate?.didFinishWithCityLoading()
        }
    }
    
    private func topCharacters() -> [(Character, Int)] {
        let strings = itemList.map({ $0.placeName })
        
        let combinedString = strings.joined()
        let charCount = combinedString.reduce(into: [Character: Int]()) { countDict, char in
            if char != " " {
                countDict[char, default: 0] += 1
            }
        }
        
        let sortedCharCount = charCount.sorted { $0.value > $1.value }
        
        let topCharacters = Array(sortedCharCount.prefix(3))
        
        return topCharacters
    }
    
    func getStatistiCombinedStr() -> String {
        var str = "Top 3 characters\n\n"
        for (index, data) in topCharacters().enumerated() {
            str += "\(data.0): \(data.1)" + (index == (topCharacters().count - 1) ? "" : "\n\n")
        }
        return str
    }
}
