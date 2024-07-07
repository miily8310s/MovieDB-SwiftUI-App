//
//  MovieImage.swift
//  MovieDB-SwiftUI-App
//
//  Created by erika yoshikawa on 2024/06/04.
//

import SwiftUI

struct MovieImage: View {
    let urlPath: String
    var height: Int?
    var contentMode: ContentMode?

    func getUrl() -> URL {
        URL(string: "https://image.tmdb.org/t/p/original\(urlPath)")!
    }

    var body: some View {
        AsyncImage(url: getUrl()) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: contentMode ?? .fit)
            } else if phase.error != nil {
                Text("No image")
            } else {
                ProgressView()
            }
        }
        .frame(height: CGFloat(height ?? 200))
    }
}

#Preview {
    let urlPath = "/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg"
    return MovieImage(urlPath: urlPath)
}
