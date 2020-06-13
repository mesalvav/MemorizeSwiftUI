//
//  HarcodedTheme.swift
//  MemorizeSwiftUI
//
//  Created by mariosalvatierra on 6/13/20.
//  Copyright © 2020 mariosalvatierra. All rights reserved.
//

import SwiftUI


struct HardcodedTheme {
    static let allData = [
        "Halloween": HardData(name: "Halloween", emojisArray: ["👻", "🎃", "🕷","👽","💀"], colorTheme: Color.orange,isTheNumberOfCardToshowRandom: true),
        
        "Sports":HardData(name: "Sports", emojisArray: ["⚽️","🏀","🏈","⚾️","🎾"], colorTheme: Color.green, isTheNumberOfCardToshowRandom: false),
        
        "Shoes":HardData(name: "Shoes", emojisArray: ["🥾","👞","👠","👢","👟"], colorTheme: Color.red, isTheNumberOfCardToshowRandom: false),
        
        "Animals":HardData(name: "Animals", emojisArray: ["🐁","🦨","🦜","🦞","🦧"], colorTheme: Color.pink, isTheNumberOfCardToshowRandom: false),
        
        "Hands":HardData(name: "Shoes", emojisArray: ["🤏🏻","🤙🏿","✍️","☝🏽","🖐🏻"], colorTheme: Color.blue, isTheNumberOfCardToshowRandom: false),
        
        "Clouds":HardData(name: "Shoes", emojisArray: ["⛅️","🌧","🌁","🌩","💨"], colorTheme: Color.yellow, isTheNumberOfCardToshowRandom: false)
        
    ]
    
    struct HardData {
            var name:String
            var emojisArray:[String]
            var colorTheme: Color
            var isTheNumberOfCardToshowRandom: Bool
        }
    
   }
   
