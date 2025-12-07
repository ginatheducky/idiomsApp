//
//  ContentView.swift
//  idiomsApp
//
//  Created by Gina on 05.12.25.
//

import SwiftUI

struct ContentView: View {
    // we can now access the idioms because as soon as we create an instance of Idioms, the idioms get stores in englishIdioms
    let idioms = Idioms()
    
    // use for filtering and searching
    @State var searchText = ""
    @State var alphabetical = false
    
    var filteredIdioms: [EnglishIdiom] {
        idioms.sort(by: alphabetical)
        return idioms.search(for: searchText)
    }
    
//    var filteredDinos: [ApexPredator] {
//        predators.filter(by: currentSelection)
//        predators.sort(by: alphabetical)
//        return predators.search(for: searchText)
//    }
    
    var body: some View {
        NavigationStack {
            // List is also a special view, that comes with scrolling and loading but the data has to follow the Identifiable protocol
            List(filteredIdioms) { idiom in
                HStack {
                    // phrase
                    Text(idiom.phrase)
                    
                    // have a spacer, to push the difficulty level to the far right side
                    Spacer()
                    
                    // phrase type
                    Image(systemName: idiom.type.icon)
                        .foregroundStyle(idiom.type.color)
                    
                    // difficulty
                    Image(systemName: idiom.difficulty.icon)
                }
            }
            .navigationTitle(Text("Idioms, Slangs and Colloquialisms"))
            .searchable(text: $searchText)
            .autocorrectionDisabled(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        // sort alphabetical
                        withAnimation {
                            alphabetical.toggle()
                        }
                    } label: {
                        // after the ? the condition we want to have if alphabetical is true
                        HStack {
                            Image(systemName: "textformat")
                            Image(systemName: alphabetical ? "arrow.down" : "arrow.up")
                        }
                        .symbolEffect(.bounce, value: alphabetical)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
