//
//  PhotoRowView.swift
//  Unforgettable
//
//  Created by Frédéric Helfer on 09/11/22.
//

import SwiftUI

struct PhotoRowView: View {
    @ObservedObject var vm: PhotoViewModel
    var photo: PhotoModel
    
    var body: some View {
        NavigationLink {
            PhotoDetailView(vm: vm, photo: photo)
        } label: {
            HStack(spacing: 15) {
                if let image = vm.manager.get(key: photo.id) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 65, height: 65)
                        .cornerRadius(15)
                        .shadow(radius: 2)
                    
                } else {
                    ProgressView()
                }
                
                Text(photo.name)
                    .font(.title3)
                
                Spacer()
            }
            .padding(2)
        }
        .swipeActions(edge: .leading, allowsFullSwipe: false) {
            Button("Edit") {
                vm.getPhoto(photo: photo)
                vm.editingPhoto = true
            }
            .tint(.blue)
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
            Button {
                vm.deletePhoto(photo: photo)
            } label: {
                Image(systemName: "trash")
            }
            .tint(.red)
        }
    }
}

struct PhotoRowView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoRowView(vm: PhotoViewModel(), photo: PhotoModel.example)
//            .padding()
            .previewLayout(.sizeThatFits)
    }
}
