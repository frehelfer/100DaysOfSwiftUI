//
//  Singer-extension.swift
//  CoreDataProject
//
//  Created by Frédéric Helfer on 21/10/22.
//

import Foundation

extension SingerEntity {
    var wrappedFirstName: String {
        firstName ?? "Unknown"
    }
    
    var wrappedLastName: String {
        lastName ?? "Unknown"
    }
}
