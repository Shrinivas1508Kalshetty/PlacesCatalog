//
//  ContentView.swift
//  PlacesCatalogSwiftUI
//
//  Created by Shrinivas Kalshetty on 11/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var searchedText = ""
    @StateObject var viewModel = CitiesViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    ScrollView {
                        CityView(selectedCitiesIndex: $viewModel.selectedCategoryIndex
                                     , cities: $viewModel.cities)
                        
                        PlaceListAndSearchBarView(searchedText: $searchedText, filteredItemList: $viewModel.filteredItemList)
                            .onChange(of: searchedText) {
                                        viewModel.filterItem(for: searchedText)
                            }
                    }
                }
                DetailButtonView(topCharsCount: viewModel.topCharacters(),
                                   itemCount: viewModel.filteredItemList.count)
                    .padding(.trailing, 20)
            }
            .onAppear {
                viewModel.loadData()
                setStatusBarBackground(color: .white)
            }
            .onChange(of: viewModel.selectedCategoryIndex) {
                viewModel.loadDataAsPerCategory()
                searchedText.removeAll()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}

extension View {
    func setStatusBarBackground(color: UIColor) {
        let statusBarFrame = UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        let statusBarView = UIView(frame: statusBarFrame)
        statusBarView.backgroundColor = color
        UIApplication.shared.windows.first?.addSubview(statusBarView)
    }
}
