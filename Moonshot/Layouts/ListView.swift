//
//  ListView.swift
//  Moonshot
//
//  Created by Izaan Saleem on 21/02/2024.
//

import Foundation
import SwiftUI

struct ListView: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    let rows = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        List {
            ForEach(missions) { missions in
                NavigationLink {
                    MissionView(mission: missions, astronauts: astronauts)
                } label: {
                    VStack {
                        Image(missions.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                        
                        VStack {
                            Text(missions.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Text(missions.formattedLaunchDate)
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.5))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                    }
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    }
                }
            }
            .listRowBackground(Color.darkBackground)
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}
