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
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    Button {
                        showingImagePicker = true
                        vm.locationFetcher.start()
                    } label: {
                        Text("add photo".uppercased())
                            .font(.title3.bold())
                            .kerning(1.4)
                            .foregroundColor(.white)
                            .padding()
                            .background(.blue)
                            .cornerRadius(10)
                    }
                    .padding(20)
                    .onChange(of: vm.inputImage) { _ in
                        showingInputNameDialog = true
                    }
                    
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
