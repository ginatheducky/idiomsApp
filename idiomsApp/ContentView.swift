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
    
    var body: some View {
        // List is also a special view, that comes with scrolling and loading but the data has to follow the Identifiable protocol
        List(idioms.englishIdioms) { idiom in
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
}

#Preview {
    ContentView()
}
