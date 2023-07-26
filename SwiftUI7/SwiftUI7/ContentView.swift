//
//  ContentView.swift
//  SwiftUI7
//
//  Created by 한현민 on 2023/07/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var carStore = CarStore(cars: CarData)
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(carStore.cars) { car in
                    ExtractedView(car: car)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExtractedView: View {
    var car: Car
    
    var body: some View {
        Section {
//            Image(car.imageName)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 100, height: 100)
//                .cornerRadius(12)
            
            Text(car.name)
                .font(.headline)
            
            Text(car.description)
                .font(.body)
            
            HStack {
                Text("Hybrid")
                    .font(.headline)
                Spacer()
                Text(car.isHybrid ? "Yes" : "No")
            }
        }
    }
}
