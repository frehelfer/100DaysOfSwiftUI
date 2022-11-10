//
//  InputImageNameView.swift
//  Unforgettable
//
//  Created by Frédéric Helfer on 09/11/22.
//

import SwiftUI

struct InputImageNameView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var vm: PhotoViewModel
    @Binding var showingInputNameDialog: Bool
    
    var body: some View {
        VStack(spacing: 13) {
            HStack {
                Spacer()
                Button {
                    vm.inputImageName = ""
                    dismiss()
                } label: {
                    Label("Exit", systemImage: "xmark")
                        .labelStyle(.iconOnly)
                        .font(.title2)
                        .foregroundColor(.gray)
                        .padding()
                }
            }

            
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
                vm.addPhoto()
                dismiss()
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

struct InputImageNameView_Previews: PreviewProvider {
    static var previews: some View {
        InputImageNameView(vm: PhotoViewModel(), showingInputNameDialog: .constant(true))
    }
}
