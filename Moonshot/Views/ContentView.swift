//
//  ContentView.swift
//  Moonshot
//
//  Created by Izaan Saleem on 19/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingGrid: Bool = false
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationStack {
            Group {
                if showingGrid {
                    GridView(astronauts: astronauts, missions: missions)
                } else {
                    ListView(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    withAnimation {
                        self.showingGrid.toggle()
                    }
                } label: {
                    Image(systemName: !showingGrid ? "square.grid.2x2" : "list.bullet")
                        .foregroundStyle(.white)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
