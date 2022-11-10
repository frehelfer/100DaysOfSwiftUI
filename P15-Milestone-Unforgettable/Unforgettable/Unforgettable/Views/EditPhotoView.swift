//
//  EditPhotoView.swift
//  Unforgettable
//
//  Created by Frédéric Helfer on 10/11/22.
//

import SwiftUI

struct EditPhotoView: View {
    @ObservedObject var vm: PhotoViewModel
    
    var body: some View {
        VStack(spacing: 13) {
            if let image = vm.inputImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .frame(height: 400)
                    .cornerRadius(10)
                    .shadow(radius: 4)
            }
            
            TextField("Name the photo", text: $vm.inputImageName)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.gray.opacity(0.3))
                .cornerRadius(10)
            
            Button {
                vm.editPhoto()
            } label: {
                Text("Save")
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct EditPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        EditPhotoView(vm: PhotoViewModel())
    }
}
