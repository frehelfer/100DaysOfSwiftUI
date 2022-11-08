////
////  ContentView.swift
////  AccessibilityApp
////
////  Created by Frédéric Helfer on 06/11/22.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    let pictures = [
//        "ales-krivec-15949",
//        "galina-n-189483",
//        "kevin-horstmann-141705",
//        "nicolas-tissot-335096"
//    ]
//
//    let labes = [
//        "Tulips",
//        "Frozen tree buds",
//        "Sunflowers",
//        "Fireworks"
//    ]
//
//    @State private var selectedPictures = Int.random(in: 0...3)
//
//    var body: some View {
//        Image(pictures[selectedPictures])
//            .resizable()
//            .scaledToFit()
//            .onTapGesture {
//                selectedPictures = Int.random(in: 0...3)
//            }
//            .accessibilityLabel(labes[selectedPictures])
//            .accessibilityAddTraits(.isButton)
//            .accessibilityRemoveTraits(.isImage)
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
