//
//  DetailsViews.swift
//  Habito
//
//  Created by Frédéric Helfer on 13/10/22.
//

import SwiftUI

struct DetailsViews: View {
    @ObservedObject var data: ActivityVM
    var activity: ActivityModel
    
    var body: some View {
        VStack(spacing: 13) {
            
            if !activity.description.isEmpty {
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Description:".uppercased())
                        .font(.caption)
                        .kerning(2)
                        .foregroundColor(.gray)
                        .padding(.leading, 10)
                    
                    Text(activity.description)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2).cornerRadius(10))
                }
            }
            
            VStack(spacing: 0) {
                Text("Completion count: \(activity.completionCount)")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                Button {
                    data.editActivity(activity: activity, data: data)
                } label: {
                    Text("Mark Completed")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                }
            }
            .cornerRadius(10)
            
            Spacer()
        }
        .navigationTitle(activity.title)
        .padding()
    }
}

struct DetailsViews_Previews: PreviewProvider {
    static var previews: some View {
        DetailsViews(data: ActivityVM(), activity: ActivityModel.example)
    }
}
