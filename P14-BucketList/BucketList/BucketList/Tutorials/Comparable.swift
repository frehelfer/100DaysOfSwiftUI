////
////  Comparable.swift
////  BucketList
////
////  Created by Frédéric Helfer on 04/11/22.
////
//
//import SwiftUI
//
//struct User: Identifiable, Comparable {
//    let id = UUID()
//    let firstName: String
//    let lastName: String
//    
//    static func < (lhs: User, rhs: User) -> Bool {
//        lhs.firstName > rhs.firstName
//    }
//}
//
//struct ComparableView: View {
//    private var users = [
//        User(firstName: "Frédéric", lastName: "Helfer"),
//        User(firstName: "Tanielly", lastName: "Konzen"),
//        User(firstName: "Besh", lastName: "Helfzen")
//    ].sorted()
//    
//    var body: some View {
//        List(users) { user in
//            HStack {
//                Text(user.firstName)
//                Text(user.lastName)
//            }
//        }
//    }
//}
//
//struct ComparableView_Previews: PreviewProvider {
//    static var previews: some View {
//        ComparableView()
//    }
//}
