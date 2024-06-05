//
//  HomeScreen.swift
//  MovieDB-SwiftUI-App
//
//  Created by erika yoshikawa on 2024/06/01.
//

import SwiftUI

struct HomeScreenView: View {
    @State private var trendMovies = [TrendMovie]()

    let coumns = [
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80))
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: coumns, spacing: 20) {
                    ForEach(trendMovies, id: \.id) { movie in
                        MovieFeatureCard(movie: movie)
                    }
                }
            }
            .task {
                do {
                    let result = try await MovieService().getTrendMovies()
                    trendMovies = result
                } catch {
                    print("movies not found")
                }
            }
            .navigationTitle("Feature")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//
// #Preview {
//    HomeScreenView()
// }
