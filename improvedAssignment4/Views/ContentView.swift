//
//  ContentView.swift
//  improvedAssignment4
//
//  Created by Morgan Pence on 9/26/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomePageView()
                .tabItem {
                    Label("Home", systemImage: "sparkles")
                }
            FruitsPageView()
                .tabItem {
                    Label("API", systemImage: "sparkles")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

