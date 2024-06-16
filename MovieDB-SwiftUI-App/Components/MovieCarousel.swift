//
//  MovieCarousel.swift
//  MovieDB-SwiftUI-App
//
//  Created by erika yoshikawa on 2024/06/06.
//

import SwiftUI

struct MovieCarousel: View {
    let nowPlayingMovies: [NowPlayingMovie]

    var body: some View {
        TabView {
            ForEach(nowPlayingMovies, id: \.id) { movie in
                MovieImage(urlPath: movie.backdropPath, height: 240)
                    .overlay(alignment: .bottomLeading) {
                        VStack(alignment: .leading) {
                            Text(movie.title)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Text(movie.releaseDate)
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        }
                        .padding()
                    }
            }
        }
        .tabViewStyle(.page)
        .frame(height: 240)
    }
}

#Preview {
    let movies = [
        NowPlayingMovie(
            backdropPath: "/z121dSTR7PY9KxKuvwiIFSYW8cf.jpg",
            id: 9590,
            title: "Civil War",
            releaseDate: "2024-04-10"
        ),
        NowPlayingMovie(
            backdropPath: "/pxJbfnMIQQxCrdeLD0zQnWr6ouL.jpg",
            id: 1_077_280,
            title: "Die Hart",
            releaseDate: "2023-02-22"
        )
    ]
    return MovieCarousel(nowPlayingMovies: movies)
}
