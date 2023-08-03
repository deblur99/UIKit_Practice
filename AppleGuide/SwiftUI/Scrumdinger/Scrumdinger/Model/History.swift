//
//  History.swift
//  Scrumdinger
//
//  Created by 한현민 on 2023/08/02.
//

import Foundation

struct History: Identifiable, Codable {
    let id = UUID()
    let date = Date()
    var attendees: [DailyScrum.Attendee]
}
