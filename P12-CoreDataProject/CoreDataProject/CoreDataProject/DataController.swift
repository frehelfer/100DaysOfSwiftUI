//
//  DataController.swift
//  CoreDataProject
//
//  Created by Frédéric Helfer on 21/10/22.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataProject")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
                return
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
    
    func save() {
        guard container.viewContext.hasChanges else { return }
        
        try? container.viewContext.save()
    }
}
