//
//  EmojiMemoryGame.swift
//  MemorizeSwiftUI
//
//  Created by mariosalvatierra on 6/7/20.
//  Copyright © 2020 mariosalvatierra. All rights reserved.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
   // @Published private var model: MemoryGame<String> =  EmojiMemoryGame.createMemoryGame().0
    // var tema = EmojiMemoryGame.createMemoryGame().1
    
    @Published private var newmodel: (MemoryGame<String>, Theme) =  EmojiMemoryGame.createMemoryGame()
    
    var nuevotema:Theme {
        newmodel.1
    }
    
    static func createMemoryGame() -> (MemoryGame<String>, Theme) {
        
        let randomNumber = Int.random(in: 0..<HardcodedTheme.allData.count)
        var counter = 0
        var datum: HardcodedTheme.HardData?
        
        for (_, val) in HardcodedTheme.allData {
            if counter == randomNumber {
                datum = val
            }
            counter = counter + 1
        }
        let namex = datum!.name
        print("namex: \(namex) ")
        let theme =  Theme(name: namex, numberOfPairs: 5)
       
        let memo = MemoryGame<String>(numberOfPairsOfCard: theme.emojis().count) { pairIndex in
            return theme.emojis()[pairIndex]
        }
            return (memo, theme)
        }
       
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        // model.cards
        newmodel.0.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card){
        
       // model.choose(card: card)
        newmodel.0.choose(card: card)
    }
    
    func newGame() {
       // model = EmojiMemoryGame.createMemoryGame().0
       // tema = EmojiMemoryGame.createMemoryGame().1
       newmodel = EmojiMemoryGame.createMemoryGame()
    }
}
