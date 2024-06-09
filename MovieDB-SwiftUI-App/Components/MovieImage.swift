//
//  MovieImage.swift
//  MovieDB-SwiftUI-App
//
//  Created by erika yoshikawa on 2024/06/04.
//

import SwiftUI

struct MovieImage: View {
    let urlPath: String
    var body: some View {
        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w300\(urlPath)")!) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if phase.error != nil {
                Text("No image")
            } else {
                ProgressView()
            }
        }
        .frame(height: 200)
    }
}

#Preview {
    let urlPath = "/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg"
    return MovieImage(urlPath: urlPath)
}
