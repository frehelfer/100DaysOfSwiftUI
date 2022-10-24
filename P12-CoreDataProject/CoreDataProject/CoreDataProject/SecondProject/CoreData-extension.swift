//
//  CoreData-extension.swift
//  CoreDataProject
//
//  Created by Frédéric Helfer on 24/10/22.
//

import Foundation

extension Country {
    public var wrappedFullName: String {
        fullName ?? "Unknown Country"
    }
    
    public var wrappedShortName: String {
        shortName ?? "Unknown Country"
    }
    
    public var candyArray: [Candy] {
        let set = candy as? Set<Candy> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
}

extension Candy {
    public var wrappedName: String {
        name ?? "Unknown Candy"
    }
}
