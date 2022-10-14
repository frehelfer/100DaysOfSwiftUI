//
//  heart.swift
//  Habito
//
//  Created by Frédéric Helfer on 13/10/22.
//

import SwiftUI

struct heart: View {
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: 40))
            .foregroundColor(.white)
            .background(
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color(#colorLiteral(red: 0.48117733, green: 0.04765702039, blue: 0, alpha: 0.7500617425)), Color(#colorLiteral(red: 0.6717363, green: 0.0841416195, blue: 0, alpha: 1))]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                    )
                    .frame(width: 100, height: 100)
                    .shadow(color: .red.opacity(0.7), radius: 10, x: 0, y: 10)
                    .overlay(
                        Circle()
                            .fill(.blue)
                            .frame(width: 30, height: 30)
                            .shadow(color: .red.opacity(0.5), radius: 10, x: 0, y: 10)
                            .overlay(
                                Text("2")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.white)
                            )
                        ,
                    alignment: .bottomTrailing
                    )
            )
    }
}

struct heart_Previews: PreviewProvider {
    static var previews: some View {
        heart()
    }
}
