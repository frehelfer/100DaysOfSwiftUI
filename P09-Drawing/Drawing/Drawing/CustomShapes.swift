//
//  CustomShapes.swift
//  Drawing
//
//  Created by Frédéric Helfer on 11/10/22.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
      
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct Arc: InsettableShape {
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    var insetAmount = 0.0
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
    }
    
    // DOuble with different name, very old
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct CustomShapes: View {
    var body: some View {
        VStack {
            
            Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
                .strokeBorder(.blue, lineWidth: 30)
                .frame(width: 100, height: 100)
            
            Triangle()
                .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: 100, height: 100)
            
            Circle()
                .strokeBorder(.mint, lineWidth: 30)
                .frame(width: 100, height: 100)
        }
    }
}

struct CustomShapes_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapes()
    }
}
