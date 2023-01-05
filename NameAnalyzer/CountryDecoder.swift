//
//  CountryDecoder.swift
//  NameAnalyzer
//
//  Created by KRISTINA UROSOVA on 04/01/2023.
//

import Foundation

class CountryDecoder {
    
    var countryCode: String = ""
    
    func decodeCountry(countryCode: String) -> String {
    
        let emojiString = IsoCountries.flag(countryCode: countryCode) ?? ""
        let countryString = IsoCountryCodes.find(key: countryCode)?.name ?? "Unknown"
        
        let country = emojiString + " " + countryString
        
        return country
    }
}
