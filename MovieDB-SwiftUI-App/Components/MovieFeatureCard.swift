//
//  MovieFeatureCard.swift
//  MovieDB-SwiftUI-App
//
//  Created by erika yoshikawa on 2024/06/04.
//

import SwiftUI

struct MovieFeatureCard: View {
    let movie: TrendMovie
    var body: some View {
        VStack {
            MovieImage(urlPath: movie.posterPath)
            Text(movie.title)
                .font(.headline)
                .fixedSize(horizontal: false, vertical: true)
                .frame(height: 40)
                .lineLimit(2)
            Text(movie.releaseDate)
                .font(.subheadline)
        }
    }
}

#Preview {
    let movie = TrendMovie(
        backdropPath: "/fY3lD0jM5AoHJMunjGWqJ0hRteI.jpg",
        id: 940_721, originalTitle: "ゴジラ-1.0",
        overview: "あいうえおかきくけこ",
        posterPath: "/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg",
        mediaType: .movie, adult: false, title: "Godzilla Minus One\nddd\nnn",
        originalLanguage: "ja",
        genreIDS: [878, 27, 28],
        popularity: 1006.167, releaseDate: "2023-11-03",
        video: false, voteAverage: 7.669, voteCount: 1337
    )
    return MovieFeatureCard(movie: movie)
}
