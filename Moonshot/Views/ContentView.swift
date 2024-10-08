//
//  ContentView.swift
//  Moonshot
//
//  Created by Izaan Saleem on 19/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingGrid: Bool = false
    
    //let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    //let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var astronauts: [String: Astronaut] {
        if FileManager.default.fileExists("astronauts.json") {
            do {
                let loadedAstronauts = try FileManager.default.load("astronauts.json", as: [String: Astronaut].self)
                return loadedAstronauts
            } catch {
                print("Failed to load astronauts: \(error.localizedDescription)")
                return [:]
            }
        } else {
            do {
                let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
                try FileManager.default.save(astronauts, to: "astronauts.json")
                return astronauts
            } catch {
                print("Failed to load astronauts: \(error.localizedDescription)")
                return [:]
            }
        }
    }
    
    var missions: [Mission] {
        if FileManager.default.fileExists("missions.json") {
            do {
                let loadedAstronauts = try FileManager.default.load("missions.json", as: [Mission].self)
                return loadedAstronauts
            } catch {
                print("Failed to load astronauts: \(error.localizedDescription)")
                return []
            }
        } else {
            do {
                let missions: [Mission] = Bundle.main.decode("missions.json")
                try FileManager.default.save(missions, to: "missions.json")
                return missions
            } catch {
                print("Failed to load astronauts: \(error.localizedDescription)")
                return []
            }
        }
    }

    
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
