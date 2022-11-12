//
//  Prospect.swift
//  HotProspects
//
//  Created by Frédéric Helfer on 11/11/22.
//

import Foundation

class Prospect: Identifiable, Codable, Comparable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
    var date = Date()
    
    static func < (lhs: Prospect, rhs: Prospect) -> Bool {
        lhs.name < rhs.name
    }
    
    static func == (lhs: Prospect, rhs: Prospect) -> Bool {
        lhs.name == rhs.name
    }
}

@MainActor class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect] = []
    let savePath = FileManager.default.documentsPath.appendingPathComponent("SavedData")
    
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            people = try JSONDecoder().decode([Prospect].self, from: data)
        } catch let error {
            print("Error getting data. \(error.localizedDescription)")
        }
    }
    
    private func save() {
        do {
            let encoded = try JSONEncoder().encode(people)
            try encoded.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch let error {
            print("Error saving data. \(error.localizedDescription)")
        }
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func delete(of prospect: Prospect) {
        guard let index = people.firstIndex(of: prospect) else { return }
        people.remove(at: index)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
    func sorted(by: SortType) {
        switch by {
        case .name:
            people = people.sorted()
        case .mostRecent:
            people = people.sorted { $0.date > $1.date }
        }
    }
}

enum SortType {
    case name, mostRecent
}

extension FileManager {
    var documentsPath: URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
}
