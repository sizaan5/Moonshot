//
//  ContentView.swift
//  Moonshot
//
//  Created by Izaan Saleem on 19/02/2024.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(text: String) {
        print("Creating new custom Text")
        self.text = text
    }
}

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView: View {
    
    @State private var decodedJSON: String = ""
    
    let layout = [
        /*GridItem(.fixed(80)),
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
        GridItem(.fixed(80))*/
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        NavigationStack {
            Button("Decode JSON") {
                let input = """
                {
                    "name": "Izaan Saleem",
                    "address": {
                        "street": "55 abc ave",
                        "city": "Karachi"
                    }
                }
                """
                
                let data = Data(input.utf8)
                let decoder = JSONDecoder()
                
                if let user = try? decoder.decode(User.self, from: data) {
                    print(user.address.street)
                    decodedJSON = user.name
                }
            }
            if decodedJSON != "" {
                Text("Name from Decoded JSON => \(decodedJSON)")
            }
            List(0..<6) { row in
                NavigationLink("Row: \(row)") {
                    Text("Detail \(row)")
                }
            }
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach(0..<200) {
                        Text("Item: \($0)")
                    }
                }
                Image(.example1)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { size, axis in
                        size * 0.95
                    }
                VStack(spacing: 10) {
                    ForEach(0..<2) {
                        CustomText(text: "Item: \($0)")
                            .font(.title2)
                    }
                }
                .frame(maxWidth: .infinity)
                
                
            }
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    ContentView()
}
