//
//  HomeScreen.swift
//  MovieDB-SwiftUI-App
//
//  Created by erika yoshikawa on 2024/06/01.
//

import SwiftUI

struct HomeScreenView: View {
    @State private var trendMovies = [TrendMovie]()
    @State private var nowPlayingMovies = [NowPlayingMovie]()

    let coumns = [
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80))
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                MovieCarousel(nowPlayingMovies: nowPlayingMovies)
                LazyVGrid(columns: coumns, spacing: 20) {
                    ForEach(trendMovies, id: \.id) { movie in
                        NavigationLink(destination: DetailsScreen(id: movie.id)) {
                            MovieFeatureCard(movie: movie)
                        }
                    }
                }
            }
            .task {
                do {
                    let trends = try await MovieService().getTrendMovies()
                    let nowPlayings = try await MovieService().getNowPlayingMovies()
                    trendMovies = trends
                    nowPlayingMovies = Array(nowPlayings.prefix(5))
                } catch {
                    print("movies not found")
                }
            }
            .navigationTitle("Feature")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
