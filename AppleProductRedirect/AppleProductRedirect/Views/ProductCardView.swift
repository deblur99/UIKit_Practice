//
//  ProductCardView.swift
//  AppleProductRedirect
//
//  Created by 한현민 on 2023/08/04.
//

import SwiftUI

struct ProductCardView: View {
    @State var option: Option
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(option.title)
                .fontWeight(.bold)
            
            HStack {
                Text("색상")
                    .fontWeight(.semibold)
                Spacer()
                option.color.colorImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }
            
            HStack {
                Text("칩셋")
                    .fontWeight(.semibold)
                Spacer()
                Text(option.chipset.stringFormal)
                    .multilineTextAlignment(.trailing)
            }
            
            HStack {
                Text("저장용량")
                    .fontWeight(.semibold)
                Spacer()
                Text(option.memory.stringFormal)
                    .multilineTextAlignment(.trailing)
            }
        }
        .foregroundColor(.black)
    }
}
