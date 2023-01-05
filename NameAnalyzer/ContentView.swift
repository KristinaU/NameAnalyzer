//
//  ContentView.swift
//  NameAnalyzer
//
//  Created by KRISTINA UROSOVA on 04/01/2023.
//

import SwiftUI
import Combine


struct ContentView: View {
    @StateObject var viewModel: ViewModel
    @State var name: String = ""
    @FocusState private var nameFieldIsFocused: Bool
    
    var body: some View {
        VStack{
            TextField(
                "Enter your name",
                text: $name
            )
            .focused($nameFieldIsFocused)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .border(.secondary)
            .fixedSize()
        }
        Button("Find your origin", action: viewModel.ValidateAwait(name: name) ?? { })
        VStack {
            ForEach(viewModel.countries, id: \.countryRank) {result in
                Text(result.countryCode)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
