////
////  SwitchingViewStatesWithEnum.swift
////  BucketList
////
////  Created by Frédéric Helfer on 04/11/22.
////
//
//import SwiftUI
//
//enum LoadingState {
//    case loading, success, failed
//}
//
//
//
//struct LoadingView: View {
//    var body: some View {
//        Text("Loading...")
//    }
//}
//
//struct SuccessView: View {
//    var body: some View {
//        Text("Success!")
//    }
//}
//
//struct FailedView: View {
//    var body: some View {
//        Text("Failed.")
//    }
//}
//
//
//
//struct SwitchingViewStatesWithEnum: View {
//    var loadingState = LoadingState.loading
//    
//    var body: some View {
//        switch loadingState {
//        case .loading:
//            LoadingView()
//        case .success:
//            SuccessView()
//        case .failed:
//            FailedView()
//        }
//    }
//}
//
//struct SwitchingViewStatesWithEnum_Previews: PreviewProvider {
//    static var previews: some View {
//        SwitchingViewStatesWithEnum()
//    }
//}
