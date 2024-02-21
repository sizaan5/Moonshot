//
//  Astronaut.swift
//  Moonshot
//
//  Created by Izaan Saleem on 20/02/2024.
//

import Foundation

struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}
