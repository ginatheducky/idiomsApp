//
//  Idioms.swift
//  idiomsApp
//
//  Created by Gina on 06.12.25.
//

import Foundation // is a framework that gives us access to the decoding stuff

// we need to get our json data and convert it to a format we can use
// for that we use a class

class Idioms {
    // we need a place to store the data once it is decoded
    var englishIdioms: [EnglishIdiom] = []
    
    // the decode function should run as soon as we create an Idioms instance, for that we use init
    init() { // init runs as soon as we create an instance of our Idioms class
        decodeEnglishIdiomsData()
    }
    
    // then we need a decode function
    func decodeEnglishIdiomsData() {
        // we need to get access to the json file, and tell the app where the file is located via a url
        // what we are telling the code: if you can find the json file in the main bundle, store the url in the url property
        if let url = Bundle.main.url(forResource: "100englishidioms", withExtension: "json") {
            // follow the url and decode the data, we use a do try catch, errors are caught by the catch statement so our app doesn`t crash
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase // we need to convert from snakeCase to camelCase
                englishIdioms = try decoder.decode([EnglishIdiom].self, from: data)
            } catch {
                print("Error decoding JSON data: \(error)")
            }
        }
    }
    
    func search(for searchTerm: String) -> [EnglishIdiom] {
        if searchTerm.isEmpty {
            return englishIdioms
        } else {
            return englishIdioms.filter {
                idiom in
                idiom.phrase.localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }
    
    func sort(by alphabetical: Bool) {
        englishIdioms.sort { idiom1, idiom2 in
            if alphabetical {
                idiom1.phrase < idiom2.phrase
            } else {
                idiom1.phrase > idiom2.phrase
            }
        }
    }
    
    
    
//    func search(for searchTerm: String) -> [ApexPredator] {
//        if searchTerm.isEmpty {
//            return apexPredators
//        } else {
//            return apexPredators.filter {
//                predator in
//                predator.name.localizedCaseInsensitiveContains(searchTerm)
//            }
//        }
//    }
    
//    func sort(by alphabetical: Bool) {
//        apexPredators.sort { predator1, predator2 in
//            if alphabetical {
//                predator1.name < predator2.name
//            } else {
//                predator1.id < predator2.id
//            }
//        }
//    }
//    
//    func filter(by type: APType) {
//        if type == .all {
//            apexPredators = allApexPredators
//        } else {
//            apexPredators = allApexPredators.filter { predator in
//                predator.type == type
//            }
//        }
//    }
}



