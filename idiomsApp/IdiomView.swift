//
//  IdiomView.swift
//  idiomsApp
//
//  Created by Gina on 08.12.25.
//

import SwiftUI

struct IdiomView: View {
    let idiom: EnglishIdiom
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottom) {
                // Background image
                Image(.dictionary)
                    .resizable()
                    .scaledToFit()
                
                VStack {
                    // phrase text
                    HStack {
                        Text(idiom.phrase)
                            .font(.title)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 25)
                            .overlay(alignment: .topLeading) {
                                Image(systemName: "quote.opening")
                                    .foregroundColor(.black)
                            }
                            .overlay(alignment: .bottomTrailing) {
                                Image(systemName: "quote.closing")
                                    .foregroundColor(.black)
                            }
                    }
                    .padding(.bottom, 20)
                    
                    // type, difficulty, emoji
                    HStack {
                        HStack {
                            Text(idiom.difficulty.rawValue.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Image(systemName: idiom.difficulty.icon)
                        }
                        .padding(.horizontal, 13)
                        .padding(.vertical, 5)
                        .background(Color(UIColor.secondarySystemBackground))
                        .clipShape(.capsule)
                        
                        Text(idiom.emoji)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 13)
                            .padding(.vertical, 5)
                            .background(Color(UIColor.secondarySystemBackground))
                            .clipShape(.capsule)
                        
                        HStack {
                            Text(idiom.type.rawValue)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Image(systemName: idiom.type.icon)
                                .foregroundStyle(idiom.type.color)
                        }
                        .padding(.horizontal, 13)
                        .padding(.vertical, 5)
                        .background(Color(UIColor.secondarySystemBackground))
                        .clipShape(.capsule)
                    }
                    .padding(.vertical, 20)
                }
                .frame(maxWidth: .infinity, alignment: .center) //ZStack content centered
            }
            //.padding(.bottom, 20)
            
            VStack(alignment: .leading, spacing: 5) {
                // meaning
                Text("MEANING")
                    .fontWeight(.semibold)
                Text(idiom.meaning)
                    .padding(.bottom, 20)
                
                // when to use
                Text("WHEN TO USE")
                    .fontWeight(.semibold)
                Text(idiom.whenToUse)
                    .padding(.bottom, 20)
                
                // synonyms
                VStack(alignment: .leading) {
                    Text("SYNONYMS")
                        .fontWeight(.semibold)
                    ForEach(idiom.synonyms, id: \.self) { synonym in
                        Text("• " + synonym)
                    }
                    .padding(.leading, 10)
                }
                .padding(.bottom, 20)
                
                // EXAMPLES
                Text("EXAMPLES")
                    .fontWeight(.semibold)
                // example 1
                Text(idiom.example1)
                
                // example 2
                Text(idiom.example2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16) // consistent left/right inset
            .padding(.top, 20)
    }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    let idiom = Idioms().allEnglishIdioms[17]
    IdiomView(idiom: idiom)
}
