//
//  ContentView.swift
//  SwiftUI15
//
//  Created by 한현민 on 2023/08/01.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5718, longitude: 126.9769), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region)
            
            // annotationItems 매개변수는 후행 클로저로, Annotation 객체를 받아 클로저 표현식에서 마커 형태로 구현한다.
            Map(coordinateRegion: $region, annotationItems: [
                Annotation(coordinate: CLLocationCoordinate2D(latitude: 37.5718, longitude: 126.9769))
            ]) { annotation in
                // MapPin은 iOS 16부터 deprecated
//                MapPin(coordinate: annotation.coordinate)
                
                MapMarker(coordinate: annotation.coordinate)
            }
        }
        .padding()
    }
}

struct Annotation: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
