//
//  ProductSelectView.swift
//  AppleProductRedirect
//
//  Created by 한현민 on 2023/08/04.
//

import SwiftUI

struct ProductSelectView: View {
    @ObservedObject var optionModel: OptionModel

    var body: some View {
        NavigationStack {
            List {
                Section("MacBook Air") {
                    NavigationLink {
                        SelectOptionView(optionModel: optionModel, productName: "MacBook Air 13")
                    } label: {
                        ProductLabelView(productName: "MacBook Air 13")
                    }

                    NavigationLink {
                        SelectOptionView(optionModel: optionModel, productName: "MacBook Air 15")
                    } label: {
                        ProductLabelView(productName: "MacBook Air 15")
                    }
                }
                .fontWeight(.bold)
                .foregroundColor(.black)

                Section("MacBook Pro") {}
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            .navigationTitle("상품 목록")
        }
    }
}

struct ProductSelectView_Previews: PreviewProvider {
    static var previews: some View {
        ProductSelectView(optionModel: OptionModel())
    }
}
