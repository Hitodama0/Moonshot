//
//  MissionView.swift
//  Moonshot
//
//  Created by Biagio Ricci on 06/02/23.
//

import SwiftUI


struct MissionView: View {
    let mission: Mission
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(decorative: mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.vertical)
                    Text(mission.formattedLaunchDate)
                        .font(.title)
                    VStack(alignment: .leading) {
                        
                        RectangleView()
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                            .accessibilityLabel("Mission Highlights")
                        
                        Text(mission.description)
                            .accessibilityHint(mission.description)
                        
                        RectangleView()
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    
                    CrewView(mission: mission, astronauts: astronauts)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        MissionView(mission: missions[0])
            .preferredColorScheme(.dark)
    }
}
