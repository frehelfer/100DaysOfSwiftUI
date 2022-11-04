//
//  onChange.swift
//  Instafilter
//
//  Created by Frédéric Helfer on 02/11/22.
//

import SwiftUI

struct onChange: View {
    @State private var blurAmount = 0.0
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
            
            Button("Random Blur") {
                blurAmount = Double.random(in: 0...20)
            }
        }
        .onChange(of: blurAmount) { newValue in
            print("New Value is \(newValue)")
        }
    }
}

struct onChange_Previews: PreviewProvider {
    static var previews: some View {
        onChange()
    }
}
