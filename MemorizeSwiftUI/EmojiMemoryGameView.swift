//
//  EmojiMemoryGameView.swift
//  MemorizeSwiftUI
//
//  Created by mariosalvatierra on 6/7/20.
//  Copyright © 2020 mariosalvatierra. All rights reserved.
//
// https://www.youtube.com/watch?v=jbtqIBpUG7g&list=PLpGHT1n4-mAtTj9oywMWoBx0dCGd51_yG&index=5
// https://cs193p.sites.stanford.edu
import SwiftUI

struct EmojiMemoryGameView: View {
   
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
       
        Grid(viewModel.cards) { card in
                CardView(card:card).onTapGesture {
                        self.viewModel.choose(card: card)
                }
                .padding(5)
            }
        .padding()
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
    
    private func body(for size:CGSize) -> some View {
       ZStack {
           if card.isFaceUp {
               RoundedRectangle(cornerRadius: cornerRadious).fill(Color.white)
               RoundedRectangle(cornerRadius: cornerRadious).stroke(lineWidth:edgeLineWidth)
            
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true).padding(5).opacity(0.4)
            
               Text(card.content)
           } else {
            if !card.isMatched {
                RoundedRectangle(cornerRadius: cornerRadious).fill()
            }
               
           }
           
       }
       .font(Font.system(size: fontSize(for: size)))
    }
    
    // MARK: - Drawing Constants
    
    private let cornerRadious:CGFloat = 10
    private let edgeLineWidth: CGFloat = 3
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width,size.height) * 0.7
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let emoMV = EmojiMemoryGame()
        emoMV.choose(card: emoMV.cards[0])
       return EmojiMemoryGameView(viewModel: emoMV)
    }
}
