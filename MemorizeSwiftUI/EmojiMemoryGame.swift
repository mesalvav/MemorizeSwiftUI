//
//  EmojiMemoryGame.swift
//  MemorizeSwiftUI
//
//  Created by mariosalvatierra on 6/7/20.
//  Copyright © 2020 mariosalvatierra. All rights reserved.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String> =  EmojiMemoryGame.createMemoryGame()
   
    static func createMemoryGame() -> MemoryGame<String> {
        
       let theme =  Theme(name: "Sports", numberOfPairs: 5)
        
        return MemoryGame<String>(withTheme: theme) { pairIndex in
            return theme.emojis()[pairIndex]
            }
        }
       
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    var themex:Theme {
        model.mytheme
    }
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card){
        
        model.choose(card: card)
    }
}
