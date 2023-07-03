//
//  Country.swift
//  Milestone Projects 13 - 15
//
//  Created by Артем Чжен on 28/04/23.
//

import Foundation

struct CountryData: Codable {
    var country: String
    var capital: String
    var languages: String
    var area: Int
    var population: Int
    var currency: String
    
    enum CodingKeys: String, CodingKey {
        case country = "country"
        case capital = "capital"
        case languages = "languages"
        case area = "area"
        case population = "population"
        case currency = "currency"
        
        
    }
}
