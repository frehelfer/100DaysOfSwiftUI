//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Frédéric Helfer on 21/10/22.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @State private var lastNameFilter = "A"
    @State private var filterType = FilterType.contains
    @State private var sortDescriptors = [SortDescriptor<SingerEntity>]()
    
    var body: some View {
        VStack {
            
            FilteredList(type: filterType, filterKey: "lastName", filterValue: lastNameFilter, sortDescriptors: sortDescriptors) { (singer: SingerEntity) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
                         

            Button("Add Examples") {
                let taylor = SingerEntity(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"

                let ed = SingerEntity(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"

                let adele = SingerEntity(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"

                try? moc.save()
            }

            Button("Show A") {
                lastNameFilter = "A"
            }

            Button("Show S") {
                lastNameFilter = "S"
            }
            
            Button("Begins with") {
                filterType = .beginsWith
            }
            
            Button("Contains") {
                filterType = .contains
            }
            
            Button("Sort A-Z") {
                sortDescriptors = [SortDescriptor(\.firstName)]
            }
            
            Button("Sort Z-A") {
                sortDescriptors = [SortDescriptor(\.firstName, order: .reverse)]
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .preferredColorScheme(.dark)
    }
}
