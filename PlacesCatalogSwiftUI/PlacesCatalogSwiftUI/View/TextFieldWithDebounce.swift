//
//  TextFieldWithDebounce.swift
//  PlacesCatalogSwiftUI
//
//  Created by Shrinivas Kalshetty on 11/09/24.
//

import SwiftUI

struct TextFieldWithDebounce : View {
    @Binding var debouncedText : String
    @StateObject private var textObserver = TextFieldObserver()
    
    var body: some View {
    
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.secondary)
            TextField(Constants.search, text: $textObserver.searchText)
                .font(.system(size: 17))
                .frame(height: 30)
                .padding([.leading, .bottom, .top, .trailing], 0)
                            Button {
                                textObserver.searchText.removeAll()
                            } label: {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundStyle(.gray)
                            }
                            .hidden(debouncedText.isEmpty ? true : false)
        }.onReceive(textObserver.$debouncedText) { (val) in
            debouncedText = val
        }
        .padding([.leading, .trailing], 22)
    }
}
