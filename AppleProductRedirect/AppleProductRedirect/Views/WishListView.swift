//
//  WishListView.swift
//  AppleProductRedirect
//
//  Created by 한현민 on 2023/08/04.
//

import SwiftUI

struct WishListView: View {
    @ObservedObject var optionModel: OptionModel
    
    @State var option: Option? = Option(color: .spacegray, chipset: .init(manufacturer: "Apple", name: "M2", cpuCore: 8, gpuCore: 10), memory: .init(storage: 256, scale: "GB"))
    
    @State var isShowingAddingSheet: Bool = false
    @State var isShowingOpenWebViewSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                // TO DO:
                // 장바구니 단일 뷰로 만들고,
                // sheet에서 옵션 선택하게 하여 장바구니 목록에 추가
                Section {
                    VStack(alignment: .leading, spacing: 14) {
                        Text("우측 상단의 아이콘을 클릭하여 상품을 장바구니에 추가하세요.")
                        
                        Text("장바구니에 있는 상품이 아래 목록에 나옵니다.")
                        
                        Text("상품을 선택하면 애플 공식 사이트가 열립니다.")
                    }
                }
                
                ForEach(optionModel.options) { option in
                    Section {
                        Button {
                            // 안쪽에서 바깥쪽으로 넘길 때
                            // 1. State 변수를 옵셔널로 만든다.
                            // 2. Button action에서 State 변수의 값을 변경한다.
                            // 3. 바깥쪽 sheet 내부의 뷰에 State 변수를 넘겨준다.
                            self.option = option
                            isShowingOpenWebViewSheet.toggle()
                        } label: {
                            ProductCardView(option: option)
                        }
                    }
                }
                .onDelete(perform: optionModel.deleteOption)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingAddingSheet.toggle()
                    } label: {
                        Image(systemName: "cart.badge.plus")
                    }

                }
            }
            .sheet(isPresented: $isShowingAddingSheet, content: {
                // select view
                SelectOptionView(optionModel: optionModel, isShowingSheet: $isShowingAddingSheet, productName: "MacBook Air 15")
            })
            .sheet(isPresented: $isShowingOpenWebViewSheet) {
                ProductSafariWebView(option: option)
            }
            .navigationTitle("장바구니")
        }
    }
}

//struct WishListView_Previews: PreviewProvider {
//    static var previews: some View {
//        WishListView(optionModel: OptionModel())
//    }
//}
