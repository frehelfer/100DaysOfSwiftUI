////
////  ContentView.swift
////  Flashzilla
////
////  Created by Frédéric Helfer on 12/11/22.
////
//
//import SwiftUI
//import CoreHaptics
//
//struct CoreHapticsTutorial: View {
//    @State private var engine: CHHapticEngine?
//    
//    var body: some View {
//        VStack {
//            Text("Tap here")
//                .onAppear(perform: prepareHaptics)
//                .onTapGesture(perform: complexSuccess)
//        }
//    }
//
//    func simpleSuccess() {
//        let generator = UINotificationFeedbackGenerator()
//        generator.notificationOccurred(.success)
//        
//    }
//    
//    func prepareHaptics() {
//        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
//        
//        do {
//            engine = try CHHapticEngine()
//            try engine?.start()
//        } catch {
//            print("There waz an error creating the engine: \(error.localizedDescription)")
//        }
//    }
//    
//    func complexSuccess() {
//        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
//        
//        var events = [CHHapticEvent]()
//        
//        for i in stride(from: 0, through: 1, by: 0.1) {
//            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
//            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
//            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
//            events.append(event)
//        }
//        
//        for i in stride(from: 0, through: 1, by: 0.1) {
//            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
//            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
//            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
//            events.append(event)
//        }
//        
//        do {
//            let pattern = try CHHapticPattern(events: events, parameters: [])
//            let player = try engine?.makePlayer(with: pattern)
//            try player?.start(atTime: 0)
//        } catch {
//            print("Failed to play pattern \(error.localizedDescription)")
//        }
//    }
//}
//
//struct CoreHapticsTutorial_Previews: PreviewProvider {
//    static var previews: some View {
//        CoreHapticsTutorial()
//    }
//}
