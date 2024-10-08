//
//  FileManager-Decodable.swift
//  Moonshot
//
//  Created by Izaan Saleem on 08/10/2024.
//

import Foundation

extension FileManager {
    
    // Function to check if File Exist
    func fileExists(_ fileName: String) -> Bool {
        if let path = FileManager.default.getDocumentsDirectory()?.appendingPathComponent(fileName).path {
            return FileManager.default.fileExists(atPath: path)
        } else {
            return false
        }
    }
    
    // Function to get the URL of the documents directory
    func getDocumentsDirectory() -> URL? {
        return urls(for: .documentDirectory, in: .userDomainMask).first
    }
    
    // Function to save Codable data to a file in the documents directory
    func save<T: Codable>(_ object: T, to fileName: String) throws {
        // Get the URL to the documents directory
        guard let documentsDirectory = getDocumentsDirectory() else { return }
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        
        // Encode the object into Data
        let encoder = JSONEncoder()
        let data = try encoder.encode(object)
        
        // Write the data to the specified file
        try data.write(to: fileURL)
    }
    
    // Function to load Codable data from a file in the documents directory
    func load<T: Codable>(_ fileName: String, as type: T.Type) throws -> T {
        // Get the URL to the documents directory
        guard let documentsDirectory = getDocumentsDirectory() else { fatalError("Documents directory not found.") }
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        
        // Check if the file exists
        guard fileExists(atPath: fileURL.path) else {
            throw NSError(domain: "File not found", code: 404, userInfo: nil)
        }
        
        // Load the data from the file
        let data = try Data(contentsOf: fileURL)
        
        // Decode the data into the specified type
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
