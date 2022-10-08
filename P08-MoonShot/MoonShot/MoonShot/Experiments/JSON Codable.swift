//
//  JSON Codable.swift
//  MoonShot
//
//  Created by Frédéric Helfer on 06/10/22.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct JSON_Codable: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "55, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """
            
            let data = Data(input.utf8)
            
            if let user = try? JSONDecoder().decode(User.self, from: data) {
                print(user.address.city)
            }
        }
    }
}

struct JSON_Codable_Previews: PreviewProvider {
    static var previews: some View {
        JSON_Codable()
    }
}
