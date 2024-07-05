//
//  FavoriteScreen.swift
//  MovieDB-SwiftUI-App
//
//  Created by erika yoshikawa on 2024/06/29.
//

import SwiftUI

struct FavoriteScreen: View {
    @FetchRequest(sortDescriptors: []) var movies: FetchedResults<FavoriteMovie>
    @Environment(\.managedObjectContext) private var managedObjectContext

    var body: some View {
        NavigationStack {
//            ScrollView {
            List {
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
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        let movie = movies[index]
                        managedObjectContext.delete(movie)
                    }

                    do {
                        try managedObjectContext.save()
                    } catch {
                        print("fail to delete favorite")
                    }
                })
            }
//            }
            .navigationTitle("Favorite")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                EditButton()
            }
        }
    }
}

#Preview {
    FavoriteScreen()
}
