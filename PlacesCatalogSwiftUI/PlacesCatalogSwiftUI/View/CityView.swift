//
//  CityView.swift
//  PlacesCatalogSwiftUI
//
//  Created by Shrinivas Kalshetty on 11/09/24.
//

import SwiftUI

struct CityView: View {
    @Binding var selectedCitiesIndex: Int
    @Binding var cities: [CitiesListData]
    
    var body: some View {
        TabView(selection: $selectedCitiesIndex) {
            ForEach(0..<cities.count, id: \.self) { index in
                Image(cities[index].cityName)
                    .resizable()
                    .clipShape(.rect(cornerRadius: 6))
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .frame(height: 200)
        .contentMargins(20, for: .scrollContent)
        .padding([.leading, .trailing], 10)
        .tint(Color(.systemPink))
    }
}
