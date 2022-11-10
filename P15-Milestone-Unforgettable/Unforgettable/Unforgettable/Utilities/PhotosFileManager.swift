//
//  PhotosFileManager.swift
//  Unforgettable
//
//  Created by Frédéric Helfer on 09/11/22.
//

import Foundation
import SwiftUI

class PhotosFileManager {
    
    static let instance = PhotosFileManager()
    
    private init() {
        createFolderIfNeeded()
    }
    
    private func createFolderIfNeeded() {
        let url = FileManager.photosFolderPath
        
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print("Error creating folder. \(error)")
            }
        }
    }
    
    private func getImagePath(key: String) -> URL? {
        return FileManager.photosFolderPath.appendingPathComponent(key + ".jpeg")
    }
    
    func add(key: String, value: UIImage) {
        guard
            let data = value.jpegData(compressionQuality: 0.8),
            let url = getImagePath(key: key)
        else {
            return
        }
        
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving to file manager. \(error)")
        }
    }
    
    func get(key: String) -> UIImage? {
        guard
            let url = getImagePath(key: key),
            FileManager.default.fileExists(atPath: url.path)
        else {
            return nil
        }
        
        return UIImage(contentsOfFile: url.path)
    }
}

extension FileManager {
    static var photosFolderPath: URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0].appendingPathComponent("added_photos")
    }
}
