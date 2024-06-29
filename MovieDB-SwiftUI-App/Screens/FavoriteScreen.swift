//
//  FavoriteScreen.swift
//  MovieDB-SwiftUI-App
//
//  Created by erika yoshikawa on 2024/06/29.
//

import SwiftUI

struct FavoriteScreen: View {
    @FetchRequest(sortDescriptors: []) var movies: FetchedResults<FavoriteMovie>

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(movies, id: \.id) { movie in
                        NavigationLink(destination: DetailsScreen(id: Int(movie.movieId))) {
                            MovieListCard(
                                num: nil,
                                title: movie.title!,
                                posterPath: movie.posterPath!,
                                releaseDate: movie.releaseDate!
                            )
                        }
                        .tint(.gray)
                    }
                }
            }
            .navigationTitle("Favorite")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FavoriteScreen()
}
