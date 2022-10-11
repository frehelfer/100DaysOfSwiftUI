//
//  SwiftUIView.swift
//  Drawing
//
//  Created by Frédéric Helfer on 11/10/22.
//

import SwiftUI

struct Blur: View {
    @State private var amount = 0.0
    
    var body: some View {
        VStack {
            Image("me")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .saturation(amount)
                .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

struct Blur_Previews: PreviewProvider {
    static var previews: some View {
        Blur()
    }
}
