//
//  SelectOptionView.swift
//  AppleProductRedirect
//
//  Created by 한현민 on 2023/08/04.
//

import SwiftUI

struct SelectOptionView: View {
    @ObservedObject var optionModel: OptionModel
    
    @Binding var isShowingSheet: Bool
    @State var productName: String
    
    // 장바구니에 새로 추가할 항목
//    @State var newOption: Option = Option(color: .midnight, chipset: C, memory: <#T##Memory#>)
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("요소 추가")
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // TO DO: 요소 추가
                    } label: {
                        Text("추가")
                    }
                }
            }
        }
            
    }
}

struct SelectOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectOptionView(optionModel: OptionModel(), isShowingSheet: .constant(true), productName: "MacBook Air")
    }
}
