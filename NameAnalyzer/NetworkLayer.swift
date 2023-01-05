//
//  NetworkLayer.swift
//  NameAnalyzer
//
//  Created by KRISTINA UROSOVA on 05/01/2023.
//

import Foundation

class NetworkLayer {
    
    var identifiableuContries = [IdentifiableCountry]()
    
    func fetchCountries(name: String) async {
        guard let url = URL(string: Constants().url + name)
        else
        {
            print("Invalid URL")
            return
        }
        do {
            identifiableuContries = [IdentifiableCountry]()
            var countryHere: IdentifiableCountry
            let (data, _) = try await URLSession.shared.data(from: url)
            let array: Countries = try! JSONDecoder().decode(Countries.self, from: data)
            let results = array.country
            for i in 0..<results.count {
                
                countryHere = IdentifiableCountry(countryRank: i, countryCode: results[i].country_id)
                
                identifiableuContries.append(countryHere)
            }
        }
        catch {
            print("JSON Error")
        }
    }
}
