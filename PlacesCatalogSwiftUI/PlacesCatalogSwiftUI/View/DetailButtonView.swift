//
//  DetailButtonView.swift
//  PlacesCatalogSwiftUI
//
//  Created by Shrinivas Kalshetty on 11/09/24.
//

import SwiftUI

struct DetailButtonView: View {
    @State private var isDetail = false
    var topCharsCount: [(Character, Int)]
    var itemCount = 0
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Button("") {
                isDetail.toggle()
            }
            .buttonStyle(FloatingButtonStyle(imageName: "list.dash"))
            .sheet(isPresented: $isDetail) {
                BottomSheetView(topCharsCount: topCharsCount, itemCount: itemCount)
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.height(220)])
            }
        }
    }
}
    
struct BottomSheetView: View {
    var topCharsCount: [(Character, Int)]
    var itemCount = 0
    
    var body: some View {
        Text(Constants.statistics)
            .font(.title2).bold()
        VStack(spacing: 8) {
            Text("Top 3 Characters")
            ForEach(0..<topCharsCount.count, id: \.self) { index in
                Text("\(String(topCharsCount[index].0)) :- \(topCharsCount[index].1)")
            }
        }
    }
}

struct FloatingButtonStyle: ButtonStyle {
    
    let imageName: String
    
    func makeBody(configuration: Configuration) -> some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(.white)
            .frame(width: 30, height: 30)
            .padding()
            .background(Color(.blue))
            .clipShape(Circle())
            .shadow(radius: 5)
    }
}

#Preview {
    DetailButtonView(topCharsCount: [("a", 1), ("b", 2), ("c", 3)], itemCount: 1)
}
