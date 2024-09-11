//
//  CitiesViewModel.swift
//  PlacesCatalogSwiftUI
//
//  Created by Shrinivas Kalshetty on 11/09/24.
//

import Foundation

final class CitiesViewModel: ObservableObject  {
    @Published var cities = [CitiesListData]()
    @Published var itemList = [Places]()
    @Published var filteredItemList = [Places]()
    @Published var selectedCategoryIndex = 0
    @Published var navigationTitle = ""
    
    private var fileReader: FileReader
    
    init(fileReader: FileReader = FileReader()) {
        self.fileReader = fileReader
    }
    
    func loadData() {
        guard let categoryData = fileReader.getCityData(fileName: "CitiesData") else {
            return
        }
        cities = categoryData.cities
        filteredItemList = cities.first?.visitingPlaces ?? []
        navigationTitle = cities.first?.cityName ?? ""
    }

    func filterItem(for searchedText: String) {
        filteredItemList.removeAll()
        if searchedText.isEmpty {
            filteredItemList = cities[selectedCategoryIndex].visitingPlaces
        } else {
            filteredItemList = cities[selectedCategoryIndex].visitingPlaces.filter { $0.placeName.localizedCaseInsensitiveContains( searchedText) }
        }
    }
    
    func loadDataAsPerCategory() {
        if cities.count > selectedCategoryIndex {
            let selectedCategory = cities[selectedCategoryIndex]
            filteredItemList = selectedCategory.visitingPlaces
            navigationTitle = selectedCategory.cityName
        }
    }
    
    func topCharacters() -> [(Character, Int)] {
        let strings = filteredItemList.map({ $0.placeName })
        
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
}
