//
//  ActivitiesVM.swift
//  Habito
//
//  Created by Frédéric Helfer on 13/10/22.
//

import Foundation

class ActivityVM: ObservableObject {
    @Published var activities = [ActivityModel]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Activities"){
            if let decodedItems = try? JSONDecoder().decode([ActivityModel].self, from: savedItems) {
                activities = decodedItems
                return
            }
        }
        
        activities = []
    }
    
    func createActivity(title: String, description: String) {
        let trimmedTitle = title.trimmingCharacters(in: .whitespaces)
        guard trimmedTitle.isEmpty == false else { return }
        
        let newActivity = ActivityModel(title: trimmedTitle, description: description, completionCount: 0)
        activities.append(newActivity)
    }
    
    func editActivity(activity: ActivityModel, data: ActivityVM) {
        var newActivity = activity
        newActivity.completionCount += 1
        
        if let index = data.activities.firstIndex(of: activity) {
            data.activities[index] = newActivity
        }
    }
    
    func deleteActivity(index: IndexSet) {
        activities.remove(atOffsets: index)
    }
}
