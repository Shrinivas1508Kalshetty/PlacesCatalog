//
//  SearchBarView.swift
//  PlacesCatalogSwiftUI
//
//  Created by Shrinivas Kalshetty on 11/09/24.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchedText: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 40)
                .clipShape(.rect(cornerRadius: 7))
                .foregroundStyle(.secondary.opacity(0.3))
                .padding()
                TextFieldWithDebounce(debouncedText: $searchedText)
        }
        .background(.white)
    }
}

#Preview {
    SearchBarView(searchedText: .constant(""))
}

