//
//  NetworkLayer.swift
//  NameAnalyzer
//
//  Created by KRISTINA UROSOVA on 05/01/2023.
//

import Foundation

class NetworkLayer {
    
    var results = [Country]()
    
    func fetchCountries(name: String) async {
        guard let url = URL(string: Constants().url + name)
        else
        {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let array: Countries = try! JSONDecoder().decode(Countries.self, from: data)
            results = array.country
        }
        catch {
            print("JSON Error")
        }
    }
}
