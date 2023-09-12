//
//  ContentView.swift
//  CustomAlertDemo
//
//  Created by 한현민 on 2023/09/12.
//

import SwiftUI

extension View {
    func tossAlert(
        isPresented: Binding<Bool>,
        title: String,
        point: Int,
        primaryButtonTitle: String,
        primaryAction: @escaping () -> Void
    ) -> some View {
        return modifier(
            TossAlertModifier(
                isPresented: isPresented, transition: .opacity,
                title: "포인트", point: 10, primaryButtonTitle: "다음", primaryAction: {}
            )
        )
    }
}

struct ContentView: View {
    @State private var showsAlert: Bool = false

    var body: some View {
        VStack(spacing: 50) {
            Button {
                showsAlert.toggle()
            } label: {
                Text("Alert 보여줘!")
                    .font(.title2)
            }
            .buttonStyle(.borderedProminent)
        }
        .tossAlert(isPresented: $showsAlert, title: "포인트", point: 10, primaryButtonTitle: "다음") {}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
