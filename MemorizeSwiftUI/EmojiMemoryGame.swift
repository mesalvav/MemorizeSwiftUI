//
//  EmojiMemoryGame.swift
//  MemorizeSwiftUI
//
//  Created by mariosalvatierra on 6/7/20.
//  Copyright © 2020 mariosalvatierra. All rights reserved.
//

import SwiftUI


class EmojiMemoryGame {
    
    private var model: MemoryGame<String> =  EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        
        var emojis: Array<String> = ["👻", "🎃", "🕷","ؔ👽", "☠️"]
        // MARK: - Game will start up with a random number of pairs of cards between 2 pairs and 5 pairs.
        let randomNumber = Int.random(in: 2...emojis.count)
        
        emojis.removeSubrange(randomNumber..<emojis.count)
        
        return MemoryGame<String>(numberOfPairsOfCard: emojis.count) { pairIndex in
            return emojis[pairIndex]
            
        }
           
    }
       
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    // MARK: - Intent(s)
    
    func chooseCard(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}
