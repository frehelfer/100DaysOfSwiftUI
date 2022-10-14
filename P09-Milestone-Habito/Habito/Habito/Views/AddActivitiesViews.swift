//
//  NewActivitiesViews.swift
//  Habito
//
//  Created by Frédéric Helfer on 13/10/22.
//

import SwiftUI

struct AddActivitiesViews: View {
    @ObservedObject var data: ActivityVM
    
    @State private var newActivityTitle: String = ""
    @State private var newActivityDescription: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 13) {
            Button {
               dismiss()
            } label: {
                Image(systemName: "x.square")
                    .font(.system(size: 19))
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(5)
            }
            
            Text("Add New Activity")
                .font(.title.bold())
            
            TextField("Add a title", text: $newActivityTitle)
                .padding()
                .background(Color.gray.opacity(0.2).cornerRadius(10))
            
            TextField("Add a discription", text: $newActivityDescription)
                .padding()
                .background(Color.gray.opacity(0.2).cornerRadius(10))
            
            Button {
                data.createActivity(title: newActivityTitle, description: newActivityDescription)
                dismiss()
            } label: {
                Text("Save".uppercased())
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(newActivityTitle == "" ? Color.gray.cornerRadius(10) : Color.blue.cornerRadius(10))
            }
            
            Spacer()
        }
        .padding()
    }
}

struct AddActivitiesViews_Previews: PreviewProvider {
    static var previews: some View {
        AddActivitiesViews(data: ActivityVM())
    }
}
