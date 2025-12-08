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
    @State var currentDifficultySelection = DifficultyLevel.all
    @State var currentPhraseTypeSelection = PhraseType.all
    
    var filteredIdioms: [EnglishIdiom] {
        idioms.filterDifficultyLevel(by: currentDifficultySelection)
        idioms.filterPhraseType(by: currentPhraseTypeSelection)
        idioms.sort(by: alphabetical)
        return idioms.search(for: searchText)
    }

    
    var body: some View {
        NavigationStack {
            // List is also a special view, that comes with scrolling and loading but the data has to follow the Identifiable protocol
            List(filteredIdioms) { idiom in
                NavigationLink {
                    // go to the IdiomView view
                    IdiomView(idiom: idiom)
                } label: {
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
            }
            .navigationTitle(Text("Idioms, Slangs and Colloquialisms"))
            .searchable(text: $searchText)
            .autocorrectionDisabled(true)
            .toolbar {
                // sort alphabetical functionality
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
                
                // sort by phrase type
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("FilterPhraseType", selection: $currentPhraseTypeSelection.animation()) {
                            ForEach(PhraseType.allCases) { phrase in
                                Label(phrase.rawValue.capitalized, systemImage: phrase.icon)
                            }
                        }
                    } label: {
                        Image(systemName: "book.pages")
                    }
                }
                
                // sort by difficulty
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("FilterDifficulty", selection: $currentDifficultySelection.animation()) {
                            ForEach(DifficultyLevel.allCases) { level in
                                Label(level.rawValue.capitalized, systemImage: level.icon)
                            }
                        }
                    } label: {
                        Image(systemName: "line.horizontal.star.fill.line.horizontal")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
