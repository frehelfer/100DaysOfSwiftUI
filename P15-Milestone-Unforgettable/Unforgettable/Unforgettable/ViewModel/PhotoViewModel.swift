//
//  PhotoViewModel.swift
//  Unforgettable
//
//  Created by Frédéric Helfer on 09/11/22.
//

import Foundation
import SwiftUI
import CoreLocation
import MapKit

class PhotoViewModel: ObservableObject {
    @Published var photos: [PhotoModel] = []
    @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    
    let manager = PhotosFileManager.instance
    let locationFetcher = LocationFetcher()
    
    @Published var inputImage: UIImage?
    @Published var inputImageName = ""
    @Published var editingPhoto = false
    private var photoId = ""
    private var latitude = 0.0
    private var longitude = 0.0
    
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
    
    func getPhoto(photo: PhotoModel) {
        inputImage = manager.get(key: photo.id)
        inputImageName = photo.name
        photoId = photo.id
        latitude = photo.latitude
        longitude = photo.longitude
    }
    
    func addPhoto() {
        guard let inputImage = inputImage else { return }
        getLocation()

        let newPhoto = PhotoModel(name: inputImageName, latitude: latitude, longitude: longitude)
        photos.append(newPhoto)
        
        manager.add(key: newPhoto.id, value: inputImage)
        save()
        
        inputImageName = ""
    }
    
    func deletePhoto(photo: PhotoModel) {
        guard let index = photos.firstIndex(where: { $0.id == photo.id }) else { return }
        let photo = photos[index]
        
        manager.delete(key: photo.id)
        photos.remove(at: index)
        save()
    }
    
    func editPhoto() {
        guard let index = photos.firstIndex(where: { $0.id == photoId }) else { return }
        
        let newPhoto = PhotoModel(id: photoId, name: inputImageName, latitude: latitude, longitude: longitude)
        
        photos.remove(at: index)
        photos.append(newPhoto)
        
        editingPhoto = false
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
    
    func getLocation() {
        latitude = locationFetcher.lastKnownLocation?.latitude ?? 0.0
        longitude = locationFetcher.lastKnownLocation?.longitude ?? 0.0
    }
}
