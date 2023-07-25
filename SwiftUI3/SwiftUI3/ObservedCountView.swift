//
//  ObservedCountView.swift
//  SwiftUI3
//
//  Created by 한현민 on 2023/07/24.
//

import SwiftUI

struct ObservedCountView: View {    
    @ObservedObject var countStore: CountStore
    
    var body: some View {
        HStack {
            Text("\(countStore.count)")
            
            Button {
                countStore.count += 1
            } label: {
                Text("+1 Observed")
            }
        }
    }
}

//struct ObservedCountView_Previews: PreviewProvider {
//    static var previews: some View {
//        ObservedCountView()
//    }
//}
