//
//  LabelView.swift
//  SwiftUI13
//
//  Created by 한현민 on 2023/07/31.
//

import SwiftUI

struct LabelView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Turtle Rock")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom)
            
            HStack {
                Text("Twentynine Palms,\nCalifornia")
                
                Spacer()
                
                Text("Park")
            }
        }
        .padding()
    }
}

struct LabelView_Previews: PreviewProvider {
    static var previews: some View {
        LabelView()
    }
}
