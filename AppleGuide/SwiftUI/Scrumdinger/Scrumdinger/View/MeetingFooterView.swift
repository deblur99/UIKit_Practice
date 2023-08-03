//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by 한현민 on 2023/08/02.
//

import SwiftUI

struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker]
    var skipAction: ()->Void
    
    // speakers의 요소를 순회하며 isCompleted 프로퍼티가 false인 첫 요소를 찾아 그것의 인덱스를 반환한다. 하나도 없다면 nil을 반환한다.
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: {
            !$0.isCompleted
        }) else {
            return nil
        }
        return index
    }
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted }
    }
    private var speakerText: String {
        guard let speakerNumber = speakerNumber else {
            return "No more speakers"
        }
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    
    var body: some View {
        VStack {
            HStack {
                if isLastSpeaker {
                    Text("Last Speaker")
                } else {
                    Text(speakerText)
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next Speaker")
                }
            }
        }
    }
}

struct MeetingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {}
        )
            .previewLayout(.sizeThatFits)
    }
}
