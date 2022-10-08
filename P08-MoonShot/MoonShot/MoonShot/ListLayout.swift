//
//  ListLayout.swift
//  MoonShot
//
//  Created by Frédéric Helfer on 07/10/22.
//

import SwiftUI

struct ListLayout: View {
    let astronauts: [String: Astronaut]
    let mission: [Mission]
    
    var body: some View {
        List {
            ForEach(mission) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .padding(8)
                            .padding(.horizontal)
                        VStack {
                            Text(mission.displayName)
                                .font(.title3)
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .opacity(0.5)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.lightBackground)
                        .foregroundColor(.white)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                }
                .listRowBackground(Color.darkBackground)
            }
        }
        .listStyle(.plain)
    }
}

struct ListLayout_Previews: PreviewProvider {
    static var isList = Binding.constant(true)
    
    static var previews: some View {
        ListLayout(astronauts: Bundle.main.decode(file: "astronauts.json"), mission: Bundle.main.decode(file: "mission,json"))
    }
}
