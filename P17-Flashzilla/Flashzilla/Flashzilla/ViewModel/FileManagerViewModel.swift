//
//  FileManagerViewModel.swift
//  Flashzilla
//
//  Created by Frédéric Helfer on 15/11/22.
//

import Foundation

class FileManagerViewModel: ObservableObject {
    @Published var cards: [Card] = []
    
    let savePath = FileManager.default.documentPath.appendingPathComponent("SavedData")
    
    init() {
        loadData()
    }
    
    func loadData() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decoded
            }
        }
    }
    
    func saveData() {
        if let data = try? JSONEncoder().encode(cards) {
            try? data.write(to: savePath, options: [.atomic, .completeFileProtection])
        }
    }
    
    func addCard(prompt: String, answer: String) {
        let trimmedPrompt = prompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = answer.trimmingCharacters(in: .whitespaces)
        guard trimmedPrompt.isEmpty == false && trimmedAnswer.isEmpty == false else { return }
        
        let card = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
        cards.insert(card, at: 0)
        saveData()
    }
    
    func removeCards(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
        saveData()
    }
    
    
}

extension FileManager {
    var documentPath: URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
}
