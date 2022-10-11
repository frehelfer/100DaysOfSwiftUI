//
//  ImagePaint.swift
//  Drawing
//
//  Created by Frédéric Helfer on 11/10/22.
//

import SwiftUI

struct ImagePaint: View {
    var body: some View {
        Capsule()
            .strokeBorder(ImagePaint(image: Image(systemName: "mic"), scale: 0.9), lineWidth: 20)
            .background(Color.mint)
            .frame(width: 300, height: 200)
    }
}

struct ImagePaint_Previews: PreviewProvider {
    static var previews: some View {
        ImagePaint()
    }
}
