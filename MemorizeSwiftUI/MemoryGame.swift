//
//  MemoryGame.swift
//  MemorizeSwiftUI
//
//  Created by mariosalvatierra on 6/7/20.
//  Copyright © 2020 mariosalvatierra. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    var mytheme: Theme
    var indexOfTheOneAndOnlyOneFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                    cards[index].isFaceUp = index == newValue
            }
        }
    }
    
   mutating func choose(card: Card){
        print("card choosen \(card)")
    
    if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
        if let potentialMatchIndex = indexOfTheOneAndOnlyOneFaceUpCard {
            if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                cards[chosenIndex].isMatched = true
                cards[potentialMatchIndex].isMatched = true
            }
            self.cards[chosenIndex].isFaceUp = true
        } else {
            
            indexOfTheOneAndOnlyOneFaceUpCard = chosenIndex
        }
             
        }
    
    }
    
    
    
    init(withTheme theme: Theme, cardContentFactory: (Int)->CardContent){
        self.mytheme = theme
        let numberOfPairsOfCard = theme.emojis().count
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
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
