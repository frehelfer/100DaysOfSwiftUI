//
//  SwiftUIView.swift
//  Drawing
//
//  Created by Frédéric Helfer on 11/10/22.
//

import SwiftUI

struct CustomPaths: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
//            path.closeSubpath()
        }
        .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CustomPaths()
    }
}
