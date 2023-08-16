//
//  ContentView.swift
//  NedMemoReal
//
//  Created by 한현민 on 2023/08/16.
//

import Firebase
import SwiftUI

struct ContentView: View {
    @StateObject var memoStore: MemoStore = .init()
    
    @State private var isLoaded: Bool = false
    @State var text: String = ""
    @State var searchText: String = ""
    
    var searchMemos: [Memo] {
        if searchText.isEmpty {
            return memoStore.memos
        } else {
            return memoStore.memos.filter { memo in
                memo.text.contains(searchText)
            }
        }
    }
    
    let databaseRef = Database.database().reference()
    
    var body: some View {
        if !isLoaded {
            ProgressView()
                .task {
                    memoStore.fetchMemo()
                    isLoaded.toggle()
                }
        } else {
            NavigationStack {
                VStack {
                    List {
                        ForEach(searchMemos) { memo in
                            Text(memo.text)
                        }
                        // perform: (IndexSet) -> Void
                        //                    .onDelete(perform: memoStore.removeMemo)
                        //                    .onDelete { IndexSet in
                        //                        memoStore.removeMemo(at: IndexSet)
                        //                    }
                        .onDelete {
                            memoStore.removeMemo(at: $0)
                        }
                    }
                    
                    HStack {
                        TextField("Add new memo", text: $text)
                        Button("Add") {
                            memoStore.addMemo(memo: Memo(text: text))
                            text = ""
                            
                            Task {
                                memoStore.fetchMemo()
//                                await memoStore.exportMemo()
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle("Memo")
                .refreshable {
                    Task {
                        memoStore.fetchMemo()
                    }
                }
            }
            .searchable(text: $searchText, prompt: "메모 검색...")
        }
    }
    
//    func observeLightState() {
//        databaseRef.child("lightOn").observe(.value) { DataSnapshot in
//            if let value = DataSnapshot.value as? Bool {
//
//            }
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
