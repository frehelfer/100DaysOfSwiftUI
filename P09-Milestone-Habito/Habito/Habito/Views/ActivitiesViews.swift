//
//  ActivitiesViews.swift
//  Habito
//
//  Created by Frédéric Helfer on 13/10/22.
//

import SwiftUI

struct ActivitiesViews: View {
    @StateObject var data = ActivityVM()
    
    @State private var addActivitiesSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data.activities) { activity in
                    NavigationLink {
                        DetailsViews(data: data, activity: activity)
                    } label: {
                        HStack {
                            Text(activity.title)
                            
                            Spacer()
                            
                            Text("\(activity.completionCount)")
                                .foregroundColor(.white)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.blue)
                                        .frame(width: 40, height: 28)
                                )
                                .padding(.horizontal)
                        }
                    }
                }
                .onDelete(perform: data.deleteActivity)
            }
            .navigationTitle("Habito")
            .toolbar {
                Button {
                    addActivitiesSheet.toggle()
                } label: {
                    Label("Add new activity", systemImage: "plus.circle")
                }
            }
        }
        .sheet(isPresented: $addActivitiesSheet) {
            AddActivitiesViews(data: data)
        }
    }
}

struct ActivitiesViews_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesViews()
    }
}
