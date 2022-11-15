////
////  NotifyBackground.swift
////  Flashzilla
////
////  Created by Frédéric Helfer on 14/11/22.
////
//
//import SwiftUI
//
//struct NotifyBackground: View {
//    @Environment(\.scenePhase) var scenePhase
//    
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .padding()
//            .onChange(of: scenePhase) { newValue in
//                if newValue == .active {
//                    print("Active")
//                } else if newValue == .inactive {
//                    print("Inactive")
//                } else if newValue == .background {
//                    print("Background")
//                }
//            }
//    }
//}
//
//struct NotifyBackground_Previews: PreviewProvider {
//    static var previews: some View {
//        NotifyBackground()
//    }
//}
