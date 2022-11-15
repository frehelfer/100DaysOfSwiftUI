////
////  TimePublisher.swift
////  Flashzilla
////
////  Created by Frédéric Helfer on 14/11/22.
////
//
//import SwiftUI
//import Combine
//
//struct TimePublisher: View {
//    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
//    @State private var counter = 0
//    
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .onReceive(timer) { time in
//                if counter == 5 {
//                    timer.upstream.connect().cancel()
//                } else {
//                    print("Timer now: \(time)")
//                }
//                
//                counter += 1
//            }
//    }
//}
//
//struct TimePublisher_Previews: PreviewProvider {
//    static var previews: some View {
//        TimePublisher()
//    }
//}
