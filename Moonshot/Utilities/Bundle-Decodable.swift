//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Izaan Saleem on 20/02/2024.
//

import Foundation

extension Bundle {
    ///This function is used to decode
    ///[String: Astronaut] dicrionary
    ///This is a single method using for single task and not generic
    /*func decode(_ file: String) -> [String: Astronaut] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) in bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode([String: Astronaut].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        return loaded
    }*/
    
    ///This function is used to decode
    ///Any kind of data as long as it's confoms the `Codable` protocol.
    ///This is a single method using to decode multiple kind of
    ///data using swift generic `T`, `<T: Codable>` and return `T`
    ///meaning it will return whatever the type is given
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) in bundle.")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        return loaded
    }
}
