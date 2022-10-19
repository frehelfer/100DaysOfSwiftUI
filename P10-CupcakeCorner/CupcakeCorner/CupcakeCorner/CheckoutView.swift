//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Frédéric Helfer on 18/10/22.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var data: OrderViewModel

    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    @State private var showingConnectionFailed = false

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)

                Text("Your total is \(data.cost, format: .currency(code: "USD"))")
                    .font(.title)

                Button("Place Order") {
                    Task {
                        await placeOrder()
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Thank you!", isPresented: $showingConfirmation) {
            Button("OK") { }
        } message: {
            Text(confirmationMessage)
        }
        .alert("Connection Failed", isPresented: $showingConnectionFailed) {
            Button("OK") {  }
        } message: {
            Text("Check your internet connection and try again.")
        }
    }

    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(data.order) else {
            print("Failed to encode order")
            return
        }

        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"

        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)

            let decodedOrder = try JSONDecoder().decode(OrderModel.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.quantity)x \(OrderViewModel.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true
        } catch {
            print("Checkout failed.")
            showingConnectionFailed = true
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(data: OrderViewModel())
    }
}
