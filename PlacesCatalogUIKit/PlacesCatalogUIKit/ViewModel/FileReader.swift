//
//  FileReader.swift
//  PlacesCatalogUIKit
//
//  Created by Shrinivas Kalshetty on 11/09/24.
//

import Foundation

struct FileReader {
    func getCityData(fileName : String) -> Cities? {
        
        if let jsonData = Bundle.main.path(forResource: fileName, ofType: "json") {
            if let cities = try? Data(contentsOf: URL(fileURLWithPath: jsonData), options: .alwaysMapped) {
                return try? JSONDecoder().decode(Cities.self, from: cities)
            }
        }
        return nil
    }
}
