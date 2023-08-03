//
//  DetailView.swift
//  Scrumdinger
//
//  Created by 한현민 on 2023/08/01.
//

// Label, background, .cornerRadius 잘 활용하는 것이 중요

import SwiftUI

struct DetailView: View {
    @State var scrum: DailyScrum
    
    @State private var editingScrum = DailyScrum.emptyScrum
    @State private var isPresentingEditView = false

    var body: some View {
        List {
            Section("Meeting Info") {
                NavigationLink {
                    MeetingView(scrum: $scrum)
                } label: {
                    // Label 이거하고
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                
                HStack {
                    Label("Length", systemImage: "clock")
                    
                    Spacer()
                    
                    Text("\(scrum.lengthInMinutes) minutes")
                        .padding(4)
                        // foregroundColor 이거
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
                
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                }
                .accessibilityElement(children: .combine)
            }
            
            Section("Attendees") {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
            
            Section("History") {
                if scrum.history.isEmpty {
                    Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
                } else {
                    ForEach(scrum.history) { history in
                        HistoryView(history: history)
                    }
                }
            }
        }
        .navigationTitle(scrum.title)
        // toolbar의 버튼을 누르면 sheet가 올라오는데,
        // 이때 편집중인 인스턴스가 지정된다.
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                // toolbar 열면 편집중인 scrum 넣고
                editingScrum = scrum
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                // sheet 열리면서 DetailEditView에 editingScrum이 들어간다.
                DetailEditView(scrum: $editingScrum)
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                // 수정이 완료되면 sheet가 닫히며 editingScrum의 상태값이 scrum에 적용된다.
                                scrum = editingScrum
                            }
                        }
                    }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(scrum: DailyScrum.sampleData[0])
    }
}
