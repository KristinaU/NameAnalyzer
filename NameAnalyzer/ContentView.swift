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
    @FocusState private var nameIsShown: Bool
    var body: some View {
        VStack{
            Text("Find your origin by your name!")
            TextField(
                "Your name",
                text: $name
            )
            .onSubmit {
                nameIsShown.toggle()
                }
            .focused($nameFieldIsFocused)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .border(.secondary)
            .fixedSize()
        }
        Button("Enter your name and press \"Return\"", action: viewModel.ValidateAwait(name: name) ?? { })
        VStack {
            ForEach(viewModel.countries, id: \.countryRank) {result in
                Text(result.countryCode)
            }
        }
        .disabled(nameIsShown)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
