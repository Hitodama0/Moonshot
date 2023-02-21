//
//  CrewView.swift
//  Moonshot
//
//  Created by Biagio Ricci on 06/02/23.
//

import SwiftUI

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct CrewView: View {
    let mission: Mission
    let crew: [CrewMember]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(decorative: crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(RoundedRectangle(cornerRadius: 16,
                                                            style: .continuous))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16,
                                                     style: .continuous)
                                    .strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundColor(crewMember.role == "Commander" ? .red : .green)
                            }
                            .accessibilityLabel("\(crewMember.astronaut.name), \(crewMember.role)")
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
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

struct CrewView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        CrewView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
