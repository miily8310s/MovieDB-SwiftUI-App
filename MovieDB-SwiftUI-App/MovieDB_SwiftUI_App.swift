//
//  MovieDB_SwiftUI_App.swift
//  MovieDB-SwiftUI-App
//
//  Created by erika yoshikawa on 2024/06/01.
//

import SwiftUI

@main
struct MovieDB_SwiftUI_App: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeScreen()
                    .tabItem {
                        Label("Feature", systemImage: "house.fill")
                    }
                RankingScreen()
                    .tabItem {
                        Label("Top Charts", systemImage: "popcorn.fill")
                    }
            }
        }
    }
}
