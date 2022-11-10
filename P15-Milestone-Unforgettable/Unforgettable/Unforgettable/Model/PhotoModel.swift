//
//  PhotoModel.swift
//  Unforgettable
//
//  Created by Frédéric Helfer on 09/11/22.
//

import Foundation
import CoreLocation

struct PhotoModel: Identifiable, Codable, Comparable {
    var id = UUID().uuidString
    var name: String
    
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static var example = PhotoModel(name: "Tany", latitude: 50.0, longitude: 50.0)
    
    static func < (lhs: PhotoModel, rhs: PhotoModel) -> Bool {
        lhs.name < rhs.name
    }
}
