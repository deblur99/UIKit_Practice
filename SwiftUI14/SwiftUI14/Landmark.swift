//
//  Landmark.swift
//  SwiftUI14
//
//  Created by 한현민 on 2023/07/31.
//

import SwiftUI
import Foundation
import CoreLocation

struct Landmark: Hashable, Codable {
    static func == (lhs: Landmark, rhs: Landmark) -> Bool {
        lhs.id == rhs.id
    }
    
    var id: Int
    var name: String
    var category: String
    var city: String
    var park: String
    var state: String
    var description: String
    
    var isFeatured: Bool
    var isFavorite: Bool
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: [String: Double]
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates["latitude"] ?? 0.0, longitude: coordinates["longitude"] ?? 0.0)
    }
}


