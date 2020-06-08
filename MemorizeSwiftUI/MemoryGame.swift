//
//  MemoryGame.swift
//  MemorizeSwiftUI
//
//  Created by mariosalvatierra on 6/7/20.
//  Copyright © 2020 mariosalvatierra. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card){
        print("card choosen \(card)")
    }
    
    init(numberOfPairsOfCard: Int, cardContentFactory: (Int)->CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCard {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
             cards.append(Card(content: content, id: pairIndex*2+1))
        }
        // MARK: - Shuffled the cards
        for _ in 0..<cards.count {
            let randomNumber = Int.random(in: 0..<cards.count)
            let randomCardRemoved = cards.remove(at: randomNumber)
            // print(randomCardRemoved)
            cards.append(randomCardRemoved)
        }
       // print("= = = array of card")
       //  print(cards)
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = true
        var content: CardContent
        var id: Int
    }
}
