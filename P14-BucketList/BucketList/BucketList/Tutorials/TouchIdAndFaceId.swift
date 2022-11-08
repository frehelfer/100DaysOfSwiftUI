////
////  TouchIdAndFaceId.swift
////  BucketList
////
////  Created by Frédéric Helfer on 05/11/22.
////
//
//import LocalAuthentication
//import SwiftUI
//
//struct TouchIdAndFaceId: View {
//    @State private var isUnlocked = false
//    
//    var body: some View {
//        VStack {
//            if isUnlocked {
//                Text("Unlocked")
//            } else {
//                Text("Locked")
//            }
//        }
//        .onAppear( perform: authenticate)
//    }
//    
//    func authenticate() {
//        let context = LAContext()
//        var error: NSError?
//        
//        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
//            let reason = "We need to unlock your data."
//            
//            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { sucess, authError in 
//                if sucess {
//                    isUnlocked = true
//                } else {
//                    // there was a problem
//                }
//            }
//        } else {
//            // no biometrics
//        }
//    }
//}
//
//struct TouchIdAndFaceId_Previews: PreviewProvider {
//    static var previews: some View {
//        TouchIdAndFaceId()
//    }
//}
