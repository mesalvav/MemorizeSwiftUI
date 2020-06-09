//
//  EmojiMemoryGameView.swift
//  MemorizeSwiftUI
//
//  Created by mariosalvatierra on 6/7/20.
//  Copyright © 2020 mariosalvatierra. All rights reserved.
//
// https://www.youtube.com/watch?v=jbtqIBpUG7g&list=PLpGHT1n4-mAtTj9oywMWoBx0dCGd51_yG&index=5
//
import SwiftUI

struct EmojiMemoryGameView: View {
   
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
       
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card:card).onTapGesture
                    {
                        self.viewModel.choose(card: card)
                }
            }
        }
        .padding(10)
        .foregroundColor(Color.orange)
        
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card

    var body: some View {
        GeometryReader  { geometry in
            
            self.body(for: geometry.size)
        }
    }
    
    func body(for size:CGSize) -> some View {
       ZStack {
           if card.isFaceUp {
               RoundedRectangle(cornerRadius: cornerRadious).fill(Color.white)
               RoundedRectangle(cornerRadius: cornerRadious).stroke(lineWidth:edgeLineWidth)
               Text(card.content)
           } else {
               RoundedRectangle(cornerRadius: self.cornerRadious).fill()
           }
           
       }
       .font(Font.system(size: fontSize(for: size)))
    }
    
    // MARK: - Drawing Constants
    
    let cornerRadious:CGFloat = 10
    let edgeLineWidth: CGFloat = 3
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width,size.height) * 0.75
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
