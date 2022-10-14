//
//  ActivitiesModel.swift
//  Habito
//
//  Created by Frédéric Helfer on 13/10/22.
//

import Foundation

struct ActivityModel: Equatable, Identifiable, Codable {
    var id: String = UUID().uuidString
    var title: String
    var description: String
    var completionCount = 0
    
    static let example = ActivityModel(title: "Play Drums", description: "Paradiddle")
}
