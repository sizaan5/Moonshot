//
//  Mission.swift
//  Moonshot
//
//  Created by Izaan Saleem on 20/02/2024.
//

import Foundation

struct Mission: Codable, Identifiable, Hashable, Equatable {
    static func == (lhs: Mission, rhs: Mission) -> Bool {
        return lhs.id == rhs.id && lhs.launchDate == rhs.launchDate && lhs.crew == rhs.crew && lhs.description == rhs.description
    }
    
    struct CrewRole: Codable, Equatable, Hashable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .long, time: .omitted) ?? "N/A"
    }
}
