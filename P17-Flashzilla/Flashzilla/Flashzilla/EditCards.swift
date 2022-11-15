//
//  EditCards.swift
//  Flashzilla
//
//  Created by Frédéric Helfer on 14/11/22.
//

import SwiftUI

struct EditCards: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm: FileManagerViewModel
    @State private var newPrompt = ""
    @State private var newAnswer = ""
    
    var body: some View {
        NavigationView {
            List {
                Section("Add new card") {
                    TextField("Prompt", text: $newPrompt)
                    TextField("Answer", text: $newAnswer)
                    Button("Add card") {
                        vm.addCard(prompt: newPrompt, answer: newAnswer)
                        newPrompt = ""
                        newAnswer = ""
                    }
                        
                }
                
                Section {
                    ForEach(0..<vm.cards.count, id:\.self) { index in
                        VStack(alignment: .leading) {
                            Text(vm.cards[index].prompt)
                                .font(.headline)
                            
                            Text(vm.cards[index].answer)
                                .foregroundColor(.secondary)
                        }
                    }
                    .onDelete(perform: vm.removeCards)
                }
            }
            .navigationTitle("Edit Cards")
            .toolbar {
                Button("Done", action: done)
            }
            .listStyle(.grouped)
            .onAppear(perform: vm.loadData)
        }
    }
    
    func done() {
        dismiss()
    }
}

struct EditCards_Previews: PreviewProvider {
    static var previews: some View {
        EditCards(vm: FileManagerViewModel())
    }
}
