//
//  Theme.swift
//  MemorizeSwiftUI
//
//  Created by mariosalvatierra on 6/13/20.
//  Copyright © 2020 mariosalvatierra. All rights reserved.
//

import Foundation

struct Theme {
    private var theArrayOfEmojis: [String] = [String]()
    var harco: HardcodedTheme.HardData
    
    init(name: String = "Halloween", numberOfPairs:Int = 1){
        if let emos = HardcodedTheme.allData[name]?.emojisArray {
            if let isrand = (HardcodedTheme.allData[name]?.isTheNumberOfCardToshowRandom) {
                if isrand {
                    let randomNumber = Int.random(in: 1...emos.count)
                    for index in 0..<randomNumber {
                        theArrayOfEmojis.append(emos[index])
                    }
                } else {
                    for index in 0..<numberOfPairs {
                        theArrayOfEmojis.append(emos[index])
                    }
                }
                
            }
            
        }
        harco = HardcodedTheme.allData[name]!
    }
    func emojis()->[String]{
        return theArrayOfEmojis
    }
}
