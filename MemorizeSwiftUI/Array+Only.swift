//
//  Array+Only.swift
//  MemorizeSwiftUI
//
//  Created by mariosalvatierra on 6/10/20.
//  Copyright © 2020 mariosalvatierra. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first: nil
    }
}
