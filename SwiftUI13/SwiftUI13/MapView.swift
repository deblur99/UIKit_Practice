//
//  MapView.swift
//  SwiftUI13
//
//  Created by 한현민 on 2023/07/31.
//

import SwiftUI
import MapKit

struct MapView: View {
    // 지도에 표시할 좌표값 입력
    @State private var region = MKCoordinateRegion(center: .init(latitude: 34.011_286, longitude: -116.166_868), span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
