//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by 한현민 on 2023/08/02.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection: Theme
    
    var body: some View {
        Picker("Theme", selection: $selection) {
            // .allCases: 열거형의 모든 요소 가져오기
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        // .constant: Binding에 상수값 부여
        ThemePicker(selection: .constant(.periwinkle))
    }
}
