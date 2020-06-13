//
//  EmojiMemoryGame.swift
//  MemorizeSwiftUI
//
//  Created by mariosalvatierra on 6/7/20.
//  Copyright © 2020 mariosalvatierra. All rights reserved.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String> =  EmojiMemoryGame.createMemoryGame().0
    var tema = EmojiMemoryGame.createMemoryGame().1
    
    static func createMemoryGame() -> (MemoryGame<String>, Theme) {
        
        let theme =  Theme(name: "Shoes", numberOfPairs: 4)
        let memo = MemoryGame<String>(numberOfPairsOfCard: theme.emojis().count) { pairIndex in
            return theme.emojis()[pairIndex]
        }
        return (memo, theme)
        }
       
    static func createTheme()->Theme {
        return Theme(name: "Sports", numberOfPairs: 5)
    }
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card){
        
        model.choose(card: card)
    }
}
