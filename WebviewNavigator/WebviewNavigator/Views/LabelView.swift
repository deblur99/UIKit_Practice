//
//  LabelView.swift
//  WebviewNavigator
//
//  Created by 한현민 on 2023/08/03.
//

import SwiftUI

struct LabelView: View {
    let myURL: MyURL
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(myURL.name)
                .padding(.bottom)
            Text(myURL.urlString)
                .foregroundColor(.blue)
        }
    }
}
