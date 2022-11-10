//
//  PhotoDetailView.swift
//  Unforgettable
//
//  Created by Frédéric Helfer on 09/11/22.
//

import SwiftUI

struct PhotoDetailView: View {
    @ObservedObject var vm: PhotoViewModel
    var photo: PhotoModel
    
    var body: some View {
        VStack {
            if let image = vm.manager.get(key: photo.id) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
        }
        .padding(20)
        .navigationTitle(photo.name)
    }
}

struct PhotoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetailView(vm: PhotoViewModel(), photo: PhotoModel.example)
    }
}
