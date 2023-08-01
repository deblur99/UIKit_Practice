//
//  LandmarkRow.swift
//  SwiftUI14
//
//  Created by 한현민 on 2023/07/31.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
        }
        .padding()
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRow(landmark: landmarks[0])
    }
}
