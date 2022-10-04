//
//  SwiftUIView.swift
//  Multiplication
//
//  Created by Frédéric Helfer on 30/09/22.
//

import SwiftUI

struct Settings: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Stepper("Enter the Multiplication Table", value: $multTable, in: 1...12)
                
                Picker("Number of Questions", selection: $nQuestions){
                    ForEach(choseQuestions, id:\.self) {
                        Text(String($0))
                    }
                }
                .pickerStyle(.segmented)
                
                Button {
                    start()
                } label: {
                    Text("Start game")
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
