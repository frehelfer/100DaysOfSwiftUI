//
//  GridLayout.swift
//  MoonShot
//
//  Created by Frédéric Helfer on 07/10/22.
//

import SwiftUI

struct GridLayout: View {
    let astronauts: [String: Astronaut]
    let mission: [Mission]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(mission) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .opacity(0.5)
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                            .foregroundColor(.white)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

struct GridLayout_Previews: PreviewProvider {
    static var isList = Binding.constant(false)
    
    static var previews: some View {
        GridLayout(astronauts: Bundle.main.decode(file: "astronauts.json"), mission: Bundle.main.decode(file: "mission.json"))
            .preferredColorScheme(.dark)
    }
}
