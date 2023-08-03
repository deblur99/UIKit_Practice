//
//  ContentView.swift
//  WebviewNavigator
//
//  Created by 한현민 on 2023/08/03.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var myURLModel = MyURLModel()

    @State var isShowingSheet: Bool = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(myURLModel.myURLs) { item in
                    NavigationLink {
                        MyWebView(urlString: item.urlString)
                    } label: {
                        LabelView(myURL: item)
                    }
                }
                .onDelete(perform: myURLModel.removeItem)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Edit") {
                        isShowingSheet.toggle()
                    }
                }
            }
            .sheet(isPresented: $isShowingSheet) {
                AddURLView(myURLModel: myURLModel, isShowingSheet: $isShowingSheet)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
