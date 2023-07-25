//
//  StateCountView.swift
//  SwiftUI3
//
//  Created by 한현민 on 2023/07/24.
//

import SwiftUI

struct StateCountView: View {
    @StateObject var countStore: CountStore = CountStore()
    
    var body: some View {
        HStack {
            Text("\(countStore.count)")
            
            Button {
                countStore.count += 1
            } label: {
                Text("+1 State")
            }
        }
    }
}

struct StateCountView_Previews: PreviewProvider {
    static var previews: some View {
        StateCountView()
    }
}
