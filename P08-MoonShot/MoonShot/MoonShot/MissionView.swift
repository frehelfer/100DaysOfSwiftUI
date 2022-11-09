//
//  MissionView.swift
//  MoonShot
//
//  Created by Frédéric Helfer on 07/10/22.
//

import SwiftUI

struct MissionView: View {
    static let astronauts: [String: Astronaut] = Bundle.main.decode(file: "astronauts.json")
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                        .accessibilityLabel(mission.badge)
                    
                    if let date = mission.launchDate {
                        Label(date.formatted(date: .complete, time: .omitted), systemImage: "calendar")
                            .font(.caption)
                            .opacity(0.7)
                            .padding(.top)
                    }
                    
                    VStack(alignment: .leading) {
                        MyDivider()
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 7)
                        
                        Text(mission.description)
                        
                        MyDivider()
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 7)
                        
                    }
                    .padding(.horizontal)
                    
                    HorizontalScrollView(crew: crew)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode(file: "missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode(file: "astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
