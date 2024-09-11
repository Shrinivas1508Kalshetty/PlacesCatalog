//
//  PlaceListAndSearchBarView.swift
//  PlacesCatalogSwiftUI
//
//  Created by Shrinivas Kalshetty on 11/09/24.
//

import SwiftUI

struct PlaceListAndSearchBarView: View {
    @Binding var searchedText: String
    @Binding var filteredItemList: [Places]

    var body: some View {
        LazyVStack(pinnedViews: .sectionHeaders) {
            Section {
                if !filteredItemList.isEmpty {
                    ForEach(filteredItemList, id: \.placeName) { item in
                        PlaceCellView(placeData: item)
                    }
                }else{
                    Text("No data found")
                }
            } header: {
                SearchBarView(searchedText: $searchedText)
            }
            
        }
    }
}

#Preview {
    PlaceCellView(placeData: Places(placeName: "Pune", image: "Pune", detail: "Pune"))
}
