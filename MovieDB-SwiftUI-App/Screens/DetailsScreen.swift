//
//  DetailsScreen.swift
//  MovieDB-SwiftUI-App
//
//  Created by erika yoshikawa on 2024/06/12.
//

import SwiftUI

struct DetailsScreen: View {
    let id: Int

    @State private var movie: MovieDetail? = nil
    @State private var cast = [Cast]()
    @State private var recommendation = [Recommendation]()

    func runTimeString(_ originalTime: Int) -> String {
        let hour = originalTime / 60
        let min = originalTime - (60 * hour)
        return "\(hour)h\(min)min"
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                if movie == nil {
                    Text("movie load fail")
                } else {
                    VStack(alignment: .leading) {
                        MovieImage(urlPath: movie!.backdropPath, height: 300)
                        VStack(alignment: .leading) {
                            HStack(alignment: .center) {
                                Text(movie!.title)
                                    .font(.title)
                                Spacer()
                                HStack(alignment: .center) {
                                    // 
                                    Button {
                                        // TODO: いいね機能
                                    } label: {
                                        Image(systemName: "heart")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 24, height: 24)
                                    }
                                    ShareLink(item: URL(string: "https://www.themoviedb.org/movie/\(movie!.id)")!) {
                                        Image(systemName: "square.and.arrow.up")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 24, height: 24)
                                    }
                                }
                            }
                            HStack {
                                Text(movie!.releaseDate)
                                Text(movie!.originalLanguage.uppercased())
                                Text(runTimeString(movie!.runtime))
                            }
                            .font(.caption)
                            HStack {
                                ForEach(movie!.genres, id: \.id) { genre in
                                    Text(genre.name)
                                        .font(.caption)
                                        .padding(6)
                                        .background(.gray)
                                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                }
                            }
                        }
                        VStack(alignment: .leading) {
                            Text("Overview")
                                .font(.title2)
                            Text(movie!.overview)
                        }
                    }
                }
            }
            .task {
                do {
                    let fetchMovie = try await MovieService().getMovieDetail(id: id)
                    movie = fetchMovie
                } catch {
                    print("fail")
                }
            }
            .ignoresSafeArea()
        }
    }
}

//
// #Preview {
//    DetailsScreen()
// }
