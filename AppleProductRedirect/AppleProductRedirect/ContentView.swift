//
//  ContentView.swift
//  AppleProductRedirect
//
//  Created by 한현민 on 2023/08/04.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var optionModel: OptionModel = OptionModel()
    
    var body: some View {
        WishListView(optionModel: optionModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
