//
//  MovieImageCircle.swift
//  MovieDB-SwiftUI-App
//
//  Created by erika yoshikawa on 2024/06/17.
//

import SwiftUI

struct MovieImageCircle: View {
    let urlPath: String
    var height: Int?

    var body: some View {
        MovieImage(urlPath: urlPath, height: height)
            .clipShape(Circle())
            .shadow(color: .gray, radius: 10)
    }
}

#Preview {
    MovieImageCircle(urlPath: "/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg")
}
