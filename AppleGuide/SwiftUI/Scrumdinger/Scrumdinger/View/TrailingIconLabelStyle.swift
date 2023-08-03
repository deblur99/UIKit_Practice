//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by 한현민 on 2023/08/01.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    // LabelStyle - Label의 title과 icon을 바꾸기 위한 프로토콜
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

// 가독성을 높이기 위해 extension 내부에 정적 프로퍼티 형태로 trailingIcon 추가
extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}
