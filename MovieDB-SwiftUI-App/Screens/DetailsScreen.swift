//
//  DetailsScreen.swift
//  MovieDB-SwiftUI-App
//
//  Created by erika yoshikawa on 2024/06/12.
//

import SwiftUI

struct DetailsScreen: View {
    let id: Int

    @State private var movie: MovieDetail?
    @State private var cast = [Cast]()
    @State private var recommendation = [Recommendation]()

    @Environment(\.dismiss) private var dismiss

    func runTimeString(_ originalTime: Int) -> String {
        let hour = originalTime / 60
        let min = originalTime - (60 * hour)
        return "\(hour)h\(min)min"
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                if movie == nil {
                    ZStack {
                        Spacer().containerRelativeFrame([.horizontal, .vertical])
                        ProgressView()
                    }
                } else {
                    VStack(alignment: .leading) {
                        MovieImage(urlPath: movie!.backdropPath, height: 300)
                        VStack(alignment: .leading) {
                            HStack(alignment: .center) {
                                Text(movie!.title)
                                    .font(.title)
                                Spacer()
                                HStack(alignment: .center) {
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
                        VStack(alignment: .leading) {
                            Divider()
                            Text("Cast")
                                .font(.title2)
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(cast, id: \.id) { cast in
                                        VStack {
                                            MovieImageCircle(urlPath: cast.profilePath ?? "", height: 100)
                                            Text(cast.name)
                                                .font(.callout)
                                        }
                                        .frame(width: 100, height: 120)
                                    }
                                }
                            }
                        }
                        VStack(alignment: .leading) {
                            Divider()
                            Text("Recommend")
                                .font(.title2)
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(recommendation, id: \.id) { movie in
                                        NavigationLink(destination: DetailsScreen(id: movie.id)) {
                                            MovieFeatureCard(
                                                posterPath: movie.posterPath,
                                                title: movie.title,
                                                voteAverage: movie.voteAverage
                                            )
                                        }
                                        .frame(width: 100)
                                    }
                                }
                                .padding(EdgeInsets(top: 0, leading: 10, bottom: 20, trailing: 10))
                            }
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 0))
                        }
                    }
                }
            }
            .task {
                do {
                    let fetchMovie = try await MovieService().getMovieDetail(id: id)
                    let fetchCast = try await MovieService().getCastById(id: id)
                    let fetchRecommendation = try await MovieService().getRecommendationsById(id: id)
                    movie = fetchMovie
                    cast = fetchCast
                    recommendation = fetchRecommendation
                } catch {
                    print("fail")
                }
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
            .toolbar(.hidden, for: .tabBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.backward")
                            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                            .background(.gray)
                            .clipShape(Circle())
                    }
                    .tint(.white)
                }
            }
        }
    }
}

//
// #Preview {
//    DetailsScreen()
// }
