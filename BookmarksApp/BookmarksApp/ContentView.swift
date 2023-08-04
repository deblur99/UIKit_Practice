//
//  ContentView.swift
//  BookmarksApp
//
//  Created by 한현민 on 2023/08/04.
//

import SwiftUI
import SafariServices

struct Bookmark: Identifiable {
    var id = UUID()
    var title: String
    var urlString: String
    var url: URL? {
        guard let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "https://naver.com") else {
            return nil
        }
        return url
    }
}

class BookmarkStore: ObservableObject {
    @Published var bookmarks: [Bookmark] = []
    
    init() {
        bookmarks = [
            Bookmark(title: "NAVER", urlString: "https://naver.com"),
            Bookmark(title: "Google", urlString: "https://google.com"),
        ]
    }
}

struct ContentView: View {
    @ObservedObject var bookmarkStore = BookmarkStore()
    
    @State var url: URL = URL(string: "https://naver.com")!
    
    @State var isShowingAdding: Bool = false
    @State var isShowingWebsite: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(bookmarkStore.bookmarks) { bookmark in
                    Button {
                        url = bookmark.url!
                        isShowingWebsite.toggle()
                    } label: {
                        Text(bookmark.title)
                    }
                }
                .onDelete {
                    bookmarkStore.bookmarks.remove(atOffsets: $0)
                }
            }
            .navigationTitle("Bookmarks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        isShowingAdding.toggle()
                    }
                }
            }
        }
        .sheet(isPresented: $isShowingAdding) {
            AddingBookmarkView(bookmarkStore: bookmarkStore, isShowingAdding: $isShowingAdding)
        }
        .sheet(isPresented: $isShowingWebsite) {
            SafariView(url: $url)
                // sheet 올라오는 높이 조절
                .presentationDetents([.medium, .large])
        }
    }
}

struct AddingBookmarkView: View {
    @ObservedObject var bookmarkStore: BookmarkStore
    @Binding var isShowingAdding: Bool
    
    @State private var title: String = ""
    @State private var urlString: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextField("URL", text: $urlString)
                    .keyboardType(.URL)
            }
            .navigationTitle("Add new bookmark")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isShowingAdding.toggle()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Submit") {
                        let bookmark: Bookmark = .init(title: title, urlString: urlString)
                        bookmarkStore.bookmarks.append(bookmark)
                        isShowingAdding.toggle()
                    }
                }
            }
        }
    }
}

struct SafariView: UIViewControllerRepresentable {
    @Binding var url: URL
    
    func makeUIViewController(context: Context) -> some UIViewController {
        SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
