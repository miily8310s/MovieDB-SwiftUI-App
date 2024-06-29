//
//  RankingScreen.swift
//  MovieDB-SwiftUI-App
//
//  Created by erika yoshikawa on 2024/06/23.
//

import SwiftUI

struct RankingScreen: View {
    @State private var rankingType: Int = 0
    @State private var movies: [TopMovie] = []

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    Section {
                        ForEach(Array(movies.enumerated()), id: \.element.id) { index, movie in
                            NavigationLink(destination: DetailsScreen(id: movie.id)) {
                                MovieListCard(
                                    num: index + 1,
                                    title: movie.title,
                                    posterPath: movie.posterPath,
                                    releaseDate: movie.releaseDate
                                )
                            }
                            .tint(.gray)
                        }
                    } header: {
                        Picker("Ranking Type", selection: $rankingType) {
                            Text("Popular").tag(0)
                            Text("Rating").tag(1)
                        }
                        .pickerStyle(.segmented)
                    }
                }
            }
            .task {
                do {
                    let fetchMovies = try await MovieService().getTopRatedMovies()
                    movies = fetchMovies
                } catch {
                    movies = []
                }
            }
            .task(id: rankingType) {
                do {
                    if rankingType == 0 {
                        let fetchMovies = try await MovieService().getPopularMovies()
                        movies = fetchMovies
                    } else {
                        let fetchMovies = try await MovieService().getTopRatedMovies()
                        movies = fetchMovies
                    }
                } catch {
                    movies = []
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Top Charts")
        }
    }
}

//
// #Preview {
//    RankingScreen()
// }
