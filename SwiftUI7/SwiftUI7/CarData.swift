//
//  CarData.swift
//  SwiftUI7
//
//  Created by 한현민 on 2023/07/25.
//

import Foundation

var CarData: [Car] = loadJson("carData.json")

func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("No file exists")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Failed to retrieve data")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Failed to decode data")
    }
}
