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
            List {
                ForEach(movies, id: \.id) { movie in
                    // https://forums.developer.apple.com/forums/thread/701449
                    ZStack {
                        NavigationLink(destination: DetailsScreen(id: Int(movie.movieId)), label: {
                            EmptyView()
                        })
                        .opacity(0.0)
                        MovieListCard(
                            num: nil,
                            title: movie.title!,
                            posterPath: movie.posterPath!,
                            releaseDate: movie.releaseDate!
                        )
                    }
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
            .listStyle(.plain)
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
