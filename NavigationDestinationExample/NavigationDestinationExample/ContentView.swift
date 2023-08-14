//
//  ContentView.swift
//  NavigationDestinationExample
//
//  Created by 한현민 on 2023/08/15.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingView: Bool = false
    @State private var isShowingSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Button("Show next view") {
                    isShowingView.toggle()
                }
            }
            .navigationTitle("Navigation Destination")
            .navigationDestination(isPresented: $isShowingView) {
                Button("Show previous view") {
                    isShowingView.toggle()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Showing Sheet") {
                        isShowingSheet.toggle()
                    }
                }
            }
            .sheet(isPresented: $isShowingSheet) {
                NavigationStack {
                    VStack {
                        Text("1")
                        Text("2")
                    }
                    .navigationTitle("Sheet View")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Close Sheet") {
                                isShowingSheet.toggle()
                            }
                        }
                    }
                }
                .presentationDetents([.height(80), .medium, .large])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
