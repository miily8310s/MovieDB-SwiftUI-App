//
//  MovieListCard.swift
//  MovieDB-SwiftUI-App
//
//  Created by erika yoshikawa on 2024/06/23.
//

import SwiftUI

struct MovieListCard: View {
    let num: Int?
    let title: String
    let posterPath: String
    let releaseDate: String

    var body: some View {
        VStack {
            HStack(spacing: 10) {
                if let num {
                    Text("\(num)")
                        .font(.title3)
                        .frame(width: 30)
                }
                HStack(spacing: 10) {
                    MovieImage(urlPath: posterPath, height: 100)
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.title3)
                            .fontWeight(.bold)
                            .lineLimit(2)
                        Text(releaseDate)
                    }
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                Image(systemName: "arrow.right.circle.fill")
                    .font(.title2)
                    .padding()
            }
            Divider()
                .background(.gray)
        }
    }
}

#Preview {
    VStack {
        MovieListCard(
            num: 1, title: "Godzilla Minus One\nddd",
            posterPath: "/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg",
            releaseDate: "2023-11-03"
        )
        MovieListCard(
            num: 18, title: "Godzilla",
            posterPath: "/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg",
            releaseDate: "2023-11-03"
        )
    }
}
