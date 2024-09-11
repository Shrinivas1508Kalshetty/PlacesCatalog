//
//  PlaceCellView.swift
//  PlacesCatalogSwiftUI
//
//  Created by Shrinivas Kalshetty on 11/09/24.
//

import SwiftUI

struct PlaceCellView: View {
    let placeData: Places
    var body: some View {
        HStack(alignment: .center) {
            Image(placeData.image)
                .resizable()
                .frame(width: 75, height: 75)
                .clipShape(.rect(cornerRadius: 5))
                .padding(.leading, 5)
                .padding(.top, 5)
                .padding(.bottom, 5)
                .aspectRatio(contentMode: .fit)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(placeData.placeName)
                    .font(.title3)
                Text(placeData.detail)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding(8)
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .background(.cellBack)
        .cornerRadius(5)
        .shadow(radius: 2)
        .padding(.horizontal, 12)
        
    }
}

#Preview {
    PlaceCellView(placeData: Places(placeName: "Pune",
                                 image: "Pune",
                                 detail: "Pune"))
}
