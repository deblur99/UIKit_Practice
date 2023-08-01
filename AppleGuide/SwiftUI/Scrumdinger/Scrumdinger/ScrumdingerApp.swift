//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by 한현민 on 2023/08/01.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
