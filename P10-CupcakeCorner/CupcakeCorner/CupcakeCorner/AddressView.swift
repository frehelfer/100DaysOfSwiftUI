//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Frédéric Helfer on 17/10/22.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var data: OrderViewModel

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $data.order.name)
                TextField("Street address", text: $data.order.streetAddress)
                TextField("City", text: $data.order.city)
                TextField("Zip", text: $data.order.zip)
            }

            Section {
                NavigationLink {
                    CheckoutView(data: data)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(data.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(data: OrderViewModel())
        }
    }
}
