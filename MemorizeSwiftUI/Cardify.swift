//
//  Cardify.swift
//  MemorizeSwiftUI
//
//  Created by mariosalvatierra on 6/14/20.
//  Copyright © 2020 mariosalvatierra. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier {
   var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
           if isFaceUp {
               RoundedRectangle(cornerRadius: cornerRadious).fill(Color.white)
               RoundedRectangle(cornerRadius: cornerRadious).stroke(lineWidth:edgeLineWidth)
                content
           } else {
            RoundedRectangle(cornerRadius: cornerRadious).fill()
            }
        }
    }
    private let cornerRadious:CGFloat = 10
    private let edgeLineWidth: CGFloat = 3
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
