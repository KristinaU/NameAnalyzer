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
    
    func validateAwait(name: String) -> (() -> Void)? {
        
        Task {
            var country = IdentifiableCountry(countryRank: 0, countryCode: "Unknown yet")
            
            await networkLayer.fetchCountries(name: name)
            countries = [IdentifiableCountry]()
                for i in 0..<self.networkLayer.results.count {
                    
                    let countryName = CountryDecoder().decodeCountry(countryCode: networkLayer.results[i].country_id)
                    
                    country = IdentifiableCountry(countryRank: i, countryCode: countryName)
                    
                    countries.append(country)
                    if i >= 2 {
                        return
                    }
            }
        }
        
        return nil
    }
}
