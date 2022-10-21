//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Frédéric Helfer on 21/10/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var movies: FetchedResults<Movie>
    
    var body: some View {
        VStack {
            List(movies, id: \.self) { movie in
                Text(movie.wrappedTitle)
            }
            
            Button("Add") {
                let movie = Movie(context: moc)
                movie.title = "Harry Potter"
            }
            
            Button("Save") {
                do {
                    try moc.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
