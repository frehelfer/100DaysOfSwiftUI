//
//  data-extension.swift
//  UsersList
//
//  Created by Frédéric Helfer on 28/10/22.
//

import Foundation

extension CachedFriend {
    var wrappedName: String {
        name ?? "Unknown"
    }
}

extension CachedUser {
    var wrappedName: String {
        name ?? "Unknown"
    }
    
    var wrappedCompany: String {
        company ?? "Unknown"
    }
    
    var wrappedEmail: String {
        email ?? "Unknown"
    }
    
    var wrappedAddress: String {
        address ?? "Unknown"
    }
    
    var wrappedAbout: String {
        about ?? "Unknown"
    }
    
    var wrappedRegistered: Date {
        registered ?? Date.now
    }
    
    var friendsArray: [CachedFriend] {
        let set = friends as? Set<CachedFriend> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }

}
