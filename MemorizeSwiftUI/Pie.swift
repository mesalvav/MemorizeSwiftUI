//
//  Pie.swift
//  MemorizeSwiftUI
//
//  Created by mariosalvatierra on 6/14/20.
//  Copyright © 2020 mariosalvatierra. All rights reserved.
//

import SwiftUI

struct Pie: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool = false
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(startAngle.radians, endAngle.radians )
        }
        set {
            startAngle = Angle.radians(newValue.first)
            endAngle = Angle.radians(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radious = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radious * cos(CGFloat(startAngle.radians)),
            y: center.y + radious * sin(CGFloat(startAngle.radians))
        )
        
        var p = Path()
        
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radious,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: clockwise)
        p.addLine(to: center)
        
        return p
    }
    
}
