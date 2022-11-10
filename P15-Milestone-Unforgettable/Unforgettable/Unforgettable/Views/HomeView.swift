//
//  HomeView.swift
//  Unforgettable
//
//  Created by Frédéric Helfer on 09/11/22.
//

import CoreImage
import SwiftUI

struct HomeView: View {
    @StateObject var vm = PhotoViewModel()
    
    @State private var showingImagePicker = false
    @State private var showingInputNameDialog = false
    @State private var withAnimation = 0.0
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    Button {
                        showingImagePicker = true
                    } label: {
                        Text("add photo".uppercased())
                            .font(.title2.bold())
                            .kerning(1.4)
                            .foregroundColor(.white)
                            .padding()
                            .background(.blue)
                            .cornerRadius(10)
                    }
                    .onChange(of: vm.inputImage) { _ in
                        showingInputNameDialog = true
                        withAnimation = 10
                    }
                    .padding()
                    
                    List {
                        ForEach(vm.photos) { photo in
                            PhotoRowView(vm: vm, photo: photo)
                        }
                    }
                    .listStyle(.inset)
                    
                    Spacer()
                }
                .navigationTitle("Unforgettable")
                .sheet(isPresented: $showingImagePicker) {
                    ImagePicker(image: $vm.inputImage)
                }
                .sheet(isPresented: $showingInputNameDialog) {
                    InputImageNameView(vm: vm, showingInputNameDialog: $showingInputNameDialog)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
