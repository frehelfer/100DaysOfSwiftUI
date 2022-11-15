////
////  SpecificAccessibility.swift
////  Flashzilla
////
////  Created by Frédéric Helfer on 14/11/22.
////
//
//import SwiftUI
//
//func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
//    if UIAccessibility.isReduceMotionEnabled {
//        return try body()
//    } else {
//        return try withAnimation(animation, body)
//    }
//}
//
//struct SpecificAccessibility: View {
//    @Environment(\.accessibilityReduceMotion) var reduceMotion
//    @State private var scale = 1.0
//    
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .scaleEffect(scale)
//            .onTapGesture {
//                withOptionalAnimation {
//                    scale *= 1.5
//                }
//            }
//    }
//}
//
//struct SpecificAccessibility_Previews: PreviewProvider {
//    static var previews: some View {
//        SpecificAccessibility()
//    }
//}
