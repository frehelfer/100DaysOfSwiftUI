////
////  WriteDataToDocument.swift
////  BucketList
////
////  Created by Frédéric Helfer on 04/11/22.
////
//
//import SwiftUI
//
//struct WriteDataToDocument: View {
//    @State private var text = "clica aqui"
//    
//    var body: some View {
//        Text(text)
//            .onTapGesture {
//                let str = "Cadê meu texto"
//                let url = getDocumentsDirectory().appendingPathComponent("message.txt")
//                
//                
//                do {
//                    try str.write(to: url, atomically: true, encoding: .utf8)
//                    
//                    let input = try String(contentsOf: url)
//                    text = input
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
//    }
//    
//    func getDocumentsDirectory() -> URL {
//        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        return paths[0]
//    }
//}
//
//struct WriteDataToDocument_Previews: PreviewProvider {
//    static var previews: some View {
//        WriteDataToDocument()
//    }
//}
//
//// Criar uma extension pra facilitar
//
////extension FileManager {
////    func getDocumentsDirectory(fileName: String) -> URL {
////        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
////        return paths[0].appendingPathComponent("\(fileName)")
////    }
////}
