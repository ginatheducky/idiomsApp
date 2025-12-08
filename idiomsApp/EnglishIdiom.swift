//
//  EnglishIdiom.swift
//  idiomsApp
//
//  Created by Gina on 06.12.25.
//

// Scope: this is about one single idiom
// it is a model that we use to decode the data from the json file

import SwiftUI

struct EnglishIdiom: Decodable, Identifiable { // for Identifiable we need an id property, which we already have
    let id: Int
    let phrase: String
    let type: PhraseType
    let meaning: String
    let example1: String
    let example2: String
    let emoji: String
    let difficulty: DifficultyLevel
    var synonyms: [String]
    let whenToUse: String
}


enum DifficultyLevel: String, Decodable, CaseIterable, Identifiable {
    case beginner
    case intermediate
    case advanced
    case all
    
    var id: DifficultyLevel {
        self
    }
    
    var icon: String {
        switch self {
        case .beginner:
            "star"
        case .intermediate:
            "star.leadinghalf.filled"
        case .advanced:
            "star.fill"
        case .all:
            "circle"
        }
    }
}

enum PhraseType: String, Decodable, CaseIterable, Identifiable {
    case idiom
    case colloquialism
    case slang
    case all
    
    var id: PhraseType {
        self
    }
    
    var icon: String {
        switch self {
        case .idiom:
            "bookmark.fill"
        case .colloquialism:
            "bubble.left.fill"
        case .slang:
            "text.bubble.fill"
        case .all:
            "circle"
        }
    }
    
    var color: Color {
        switch self {
        case .idiom:
                .blue
        case .colloquialism:
                .yellow
        case .slang:
                .red
        case .all:
                .clear
        }
    }
}
