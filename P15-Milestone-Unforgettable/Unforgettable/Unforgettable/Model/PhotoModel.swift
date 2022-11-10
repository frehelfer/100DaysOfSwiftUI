//
//  PhotoModel.swift
//  Unforgettable
//
//  Created by Frédéric Helfer on 09/11/22.
//

import Foundation

struct PhotoModel: Identifiable, Codable, Comparable {
    var id = UUID().uuidString
    var name: String
    
    static var example = PhotoModel(name: "Tany")
    
    static func < (lhs: PhotoModel, rhs: PhotoModel) -> Bool {
        lhs.name < rhs.name
    }
}
