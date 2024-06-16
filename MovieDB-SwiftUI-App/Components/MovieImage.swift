//
//  MovieImage.swift
//  MovieDB-SwiftUI-App
//
//  Created by erika yoshikawa on 2024/06/04.
//

import SwiftUI

struct MovieImage: View {
    let urlPath: String
    var height: Int = 200

    func getUrl() -> URL {
        URL(string: "https://image.tmdb.org/t/p/original\(urlPath)")!
    }

    var body: some View {
        AsyncImage(url: getUrl()) { phase in
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
        .frame(height: CGFloat(height))
    }
}

#Preview {
    let urlPath = "/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg"
    return MovieImage(urlPath: urlPath)
}
