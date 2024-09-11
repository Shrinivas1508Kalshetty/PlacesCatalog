//
//  Cities.swift
//  PlacesCatalogUIKit
//
//  Created by Shrinivas Kalshetty on 11/09/24.
//

struct Cities: Decodable {
    var cities: [CitiesListData]
}

struct CitiesListData: Decodable {
    var cityName: String
    var visitingPlaces: [Places]
    
    enum CodingKeys: String, CodingKey {
            case cityName = "name"
            case visitingPlaces = "places"
        }
}

struct Places: Decodable {
    var placeName: String
    var image: String
    var detail: String
    
    enum CodingKeys: String, CodingKey {
            case placeName = "name"
            case image = "imageName"
            case detail = "description"
        }
}
