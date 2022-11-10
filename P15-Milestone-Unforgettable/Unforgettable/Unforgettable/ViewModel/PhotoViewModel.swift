//
//  PhotoViewModel.swift
//  Unforgettable
//
//  Created by Frédéric Helfer on 09/11/22.
//

import Foundation
import SwiftUI

class PhotoViewModel: ObservableObject {
    @Published var photos: [PhotoModel] = []
    
    let manager = PhotosFileManager.instance
    
    @Published var inputImage: UIImage?
    @Published var inputImageName = ""
    
    let savePath = FileManager.photosFolderPath.appendingPathComponent("photosData.json")
    
    init() {
        getPhotos()
    }
    
    func getPhotos() {
        do {
            let data = try Data(contentsOf: savePath)
            photos = try JSONDecoder().decode([PhotoModel].self, from: data).sorted()
        } catch let error {
            print("Error getting data. \(error)")
        }
    }
    
    func addPhoto() {
        guard let inputImage = inputImage else { return }

        let newPhoto = PhotoModel(name: inputImageName)
        photos.append(newPhoto)
        
        manager.add(key: newPhoto.id, value: inputImage)
        save()
        
        inputImageName = ""
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(photos)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch let error {
            print("Error saving data. \(error)")
        }
    }
}
