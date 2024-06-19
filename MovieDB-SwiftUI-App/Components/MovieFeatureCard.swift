//
//  MovieFeatureCard.swift
//  MovieDB-SwiftUI-App
//
//  Created by erika yoshikawa on 2024/06/04.
//

import SwiftUI

struct MovieFeatureCard: View {
    let posterPath: String
    let title: String
    let voteAverage: Double

    var body: some View {
        VStack {
            MovieImage(urlPath: posterPath)
                .overlay(alignment: .topLeading) {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                            .font(.caption)
                        Text(String(format: "%.1f", voteAverage))
                            .foregroundStyle(.white)
                            .font(.caption)
                    }
                    .font(.caption)
                    .padding(6)
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .offset(y: 15)
                }
            Text(title)
                .font(.headline)
                .fixedSize(horizontal: false, vertical: true)
                .frame(height: 40)
                .lineLimit(2)
        }
    }
}

#Preview {
    MovieFeatureCard(posterPath: "/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg",
                     title: "Godzilla Minus One\nddd\nnn",
                     voteAverage: 7.669)
}
