//
//  ContentView.swift
//  Animations
//
//  Created by Frédéric Helfer on 29/09/22.
//

import SwiftUI

struct ContentView: View {
    
    let letters = Array("Hello, SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
//    @State private var isAnimated = false
    
    var body: some View {
        
//        ZStack {
//            Color.black.ignoresSafeArea()
//
//            VStack {
//                Image(systemName: "star.circle")
//                    .foregroundColor(.white)
//                    .font(.system(size: 80))
//                    .rotationEffect(.degrees(isAnimated ? 360 : 0))
//                    .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: false), value: isAnimated)
//
//                Text("Loading...")
//                    .foregroundColor(.gray)
//                    .font(.caption)
//                    .italic()
//                    .padding(1)
//            }
//        }
//        .onAppear {
//            isAnimated = true
//        }
    
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .mint : .purple)
                    .offset(dragAmount)
                    .animation(
                        .default.delay(Double(num) / 20),
                        value: dragAmount
                    )
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
