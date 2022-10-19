//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Frédéric Helfer on 17/10/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = OrderViewModel()

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $data.order.type) {
                        ForEach(OrderViewModel.types.indices) {
                            Text(OrderViewModel.types[$0])
                        }
                    }

                    Stepper("Number of cakes: \(data.order.quantity)", value: $data.order.quantity, in: 3...20)
                }

                Section {
                    Toggle("Any special requests?", isOn: $data.specialRequestEnabled.animation())

                    if data.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $data.order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $data.order.addSprinkles)
                    }
                }

                Section {
                    NavigationLink {
                        AddressView(data: data)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
