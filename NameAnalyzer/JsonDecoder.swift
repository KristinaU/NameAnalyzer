//
//  JsonDecoder.swift
//  NameAnalyzer
//
//  Created by KRISTINA UROSOVA on 04/01/2023.
//

import Foundation

struct Countries: Codable {
    let country: [Country]
}

struct Country: Codable {
    let country_id: String
}

struct IdentifiableCountry: Codable {
    let countryRank: Int
    let countryCode: String
}

