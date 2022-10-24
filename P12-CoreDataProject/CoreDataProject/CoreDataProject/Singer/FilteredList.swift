//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Frédéric Helfer on 24/10/22.
//

import SwiftUI
import CoreData

enum FilterType: String {
    case beginsWith = "BEGINSWITH"
    case contains = "CONTAINS[c]"
}


struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>

    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            self.content(singer)
        }
    }

    init(type: FilterType = .contains, filterKey: String, filterValue: String, sortDescriptors: [SortDescriptor<T>] = [], @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptors, predicate: NSPredicate(format: "%K \(type.rawValue) %@", filterKey, filterValue))
        self.content = content
    }
}
