//
//  AddURLView.swift
//  WebviewNavigator
//
//  Created by 한현민 on 2023/08/03.
//

import SwiftUI

struct AddURLView: View {
    @ObservedObject var myURLModel: MyURLModel
    
    @Binding var isShowingSheet: Bool

    @State var name: String = ""
    @State var urlString: String = ""
    
    @State var isShowingAlert: Bool = false

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    VStack {
                        TextField("사이트명", text: $name)
                            .padding(.bottom)
                        TextField("URL 주소", text: $urlString)
                    }
                    
                }
                
                Section {
                    Button("추가하기") {
                        /**
                         일단 리터럴이란, 변수가 아닌 직접적인 값 (true, false, 10, 20, 12.3, 'a', 'b', ...)을 의미한다.
                         Swift에서는 이러한 리터럴에 직접적으로 메서드를 호출할 때, 호출한 메서드가 해당 리터럴의 상태값을 바꾸면 컴파일 에러가 발생한다.
                         결론적으로, 리터럴에 직접 메서드를 호출할 때에는 그 자체의 상태값을 바꾸는 메서드를 호출하면 안 된다. 다만, 메서드를 호출하더라도 상태값을 바꾸지 않는 메서드는 사용할 수 있다.
                         (상태값을 바꾸지 않으면 된다! ex) true.toggle()은 못쓴다!)
                         */
                        // 원래 코드
                        /*
                         isShowingAlert = myURLModel.addItem(myURL: MyURL(name: name, urlString: urlString)).toggle() -> error
                         */
                        
                        // 논리 연산자는 메서드가 아닌 연산자 그 자체이므로 사용할 수 있다.
                        isShowingAlert = !myURLModel.addItem(myURL: MyURL(name: name, urlString: urlString))
                        
                        // alert가 true인 경우일 때, 팝업창이 띄워진다. 따라서 저 경우일 때는 isShowingAlert가 뒤바뀌면 안 된다.
                        if !isShowingAlert {
                            isShowingSheet.toggle()
                        }
                    }
                }
            }
        }
        .alert("항목 추가", isPresented: $isShowingAlert) {
            Button("확인") {
                isShowingAlert.toggle()
            }
        } message: {
            Text("중복된 이름은 추가할 수 없습니다.")
        }
    }
}
