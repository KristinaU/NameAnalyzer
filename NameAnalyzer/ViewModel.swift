//
//  ViewModel.swift
//  NameAnalyzer
//
//  Created by KRISTINA UROSOVA on 04/01/2023.
//

import Foundation

class ViewModel: ObservableObject {
    let networkLayer = NetworkLayer()
    var countries = [IdentifiableCountry]()
    
    func ValidateAwait(name: String) -> (() -> Void)? {
        
        Task {
            var country = IdentifiableCountry(countryRank: 0, countryCode: "Unknown yet")
            
            await networkLayer.fetchCountries(name: name)
            countries = [IdentifiableCountry]()
                for i in 0..<self.networkLayer.identifiableuContries.count {
                    
                    let countryName = CountryDecoder().decodeCountry(countryCode: networkLayer.identifiableuContries[i].countryCode)
                    
                    country = IdentifiableCountry(countryRank: i, countryCode: countryName)
                    
                    countries.append(country)
                    print(countries)
                    if i >= 2 {
                        return
                    }
            }
        }
        
        return nil
    }
}
