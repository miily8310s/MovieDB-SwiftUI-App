//
//  SearchScreen.swift
//  MovieDB-SwiftUI-App
//
//  Created by erika yoshikawa on 2024/06/25.
//

import SwiftUI

struct SearchScreen: View {
    @State private var searchText: String = ""
    @State private var movies: [SearchMovie] = []

    @Environment(\.dismiss) private var dismiss

    let coumns = [
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80))
    ]

    func searchMovies(query: String) {
        Task {
            do {
                let fetchedMovies = try await MovieService().getFindMoviesByQuery(query: query)
                movies = fetchedMovies
            } catch {
                movies = []
            }
        }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: coumns, spacing: 20) {
                    ForEach(movies, id: \.id) { movie in
                        NavigationLink(destination: DetailsScreen(id: movie.id)) {
                            MovieFeatureCard(
                                posterPath: movie.posterPath,
                                title: movie.title,
                                voteAverage: movie.voteAverage
                            )
                        }
                    }
                }
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .tabBar)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Close", role: .cancel) {
                        dismiss()
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Enter Movie Keyword")
            .onChange(of: searchText) { _ in
                if searchText.count > 2 {
                    searchMovies(query: searchText)
                }
            }
        }
    }
}

#Preview {
    SearchScreen()
}
