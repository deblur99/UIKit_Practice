//
//  TossAlert.swift
//  CustomAlertDemo
//
//  Created by 한현민 on 2023/09/12.
//

import SwiftUI

// ViewModifier로 뷰 커스텀 가능
struct TossAlertModifier: ViewModifier {
    @Binding var isPresented: Bool
    let transition: AnyTransition
    let title: String
    let point: Int
    let primaryButtonTitle: String
    let primaryAction: () -> Void
//    let allowsTouchDismiss: Bool    // 회색 영역이 true일 때 회색 영역 터치 시 dismiss

    func body(content: Content) -> some View {
        ZStack {
            content

            ZStack {
                // animation 매개변수 value의 변수의 scope 밖에 .animation을 걸어주어야 애니메이션이 작동한다.
                if isPresented {
                    Rectangle()
                        .fill(.black.opacity(0.5))
                        .blur(radius: isPresented ? 2 : 0)
                        .ignoresSafeArea()
                        .onTapGesture {
//                            if allowsTouchDismiss {
                            self.isPresented = false
//                            }
                        }

                    TossAlert(
                        isPresented: self.$isPresented,
                        title: self.title,
                        point: self.point,
                        primaryButtonTitle: self.primaryButtonTitle,
                        primaryAction: self.primaryAction
                    )
                    // transition의 combined로 애니메이션 여러 개를 하나로 합칠 수 있다!
                    .transition(.slide.combined(with: .opacity).combined(with: .scale))
                }
            }
            .animation(
                isPresented
                    ? .spring(response: 0.3)
                    : .none,
                value: isPresented
            )
        }
    }
}

struct TossAlert: View {
    @Binding var isPresented: Bool
    let title: String
    let point: Int
    let primaryButtonTitle: String
    let primaryAction: () -> Void

    var body: some View {
        VStack(spacing: 22) {
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .frame(width: 80)
                .scaledToFit()

            Text(title)
                .font(.title)
                .bold()
                .foregroundColor(.black)

            Divider()

            HStack {}
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 18)
        .frame(width: 300) // 실무에서는 다양한 기기에 맞춰야 하기 때문에 쓰지 말것! -> 보통 기기 width의 70%를 주거나 width를 infinity로 주고 .horizontal padding을 적당히 주는 식으로 쓴다. (디자인의 문제)
        .border(.red, width: 1)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.blue.opacity(0.5))
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.white)
                )
        )
    }
}

struct TossAlert_Previews: PreviewProvider {
    static var previews: some View {
        Text("토스 알러트 테스트")
            .modifier(TossAlertModifier(isPresented: .constant(true), transition: .opacity, title: "제목", point: 10, primaryButtonTitle: "버튼", primaryAction: {}))
    }
}
