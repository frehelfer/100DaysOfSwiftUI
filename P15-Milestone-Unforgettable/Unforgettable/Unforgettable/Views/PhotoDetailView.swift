//
//  PhotoDetailView.swift
//  Unforgettable
//
//  Created by Frédéric Helfer on 09/11/22.
//

import SwiftUI
import MapKit

struct PhotoDetailView: View {
    @ObservedObject var vm: PhotoViewModel
    let photo: PhotoModel
    
    var body: some View {
        VStack(spacing: 25) {
            if let image = vm.manager.get(key: photo.id) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 400)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
            
            if photo.latitude == 0.0 && photo.longitude == 0.0 { } else {
                Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: photo.latitude, longitude: photo.longitude), span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5))), annotationItems: vm.photos) { photo in
                    MapAnnotation(coordinate: photo.coordinate) {
                        Image(systemName: "mappin")
                            .font(.system(size: 30))
                            .foregroundColor(.red)
                            .frame(width: 44, height: 44)
                            .shadow(radius: 3)
                            .background(.white.opacity(0.7))
                            .clipShape(Circle())
                    }
                }
                .frame(height: 200)
                .frame(maxWidth: .infinity)
                .cornerRadius(10)
                .shadow(radius: 10)
            }
        }
        .padding()
        .navigationTitle(photo.name)
    }
}

struct PhotoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetailView(vm: PhotoViewModel(), photo: PhotoModel.example)
    }
}
