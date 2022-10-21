//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Frédéric Helfer on 21/10/22.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16
    
    public var wrappedTitle: String {
        title ?? "Unknown"
    }
    
    public var wrappedDirectior: String {
        director ?? "Unknown"
    }
}

extension Movie : Identifiable {

}
