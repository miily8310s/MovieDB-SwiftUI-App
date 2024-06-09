//
//  MovieService.swift
//  MovieDB-SwiftUI-App
//
//  Created by erika yoshikawa on 2024/06/03.
//

import Foundation

struct MovieService {
    func getTrendMovies() async throws -> [TrendMovie] {
        guard let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day?language=en-US") else {
            throw URLError(.badURL)
        }
        guard let token = ProcessInfo.processInfo.environment["MOVIE_TOKEN"] else {
            print("not found token")
            throw URLError(.badURL)
        }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        let (data, _) = try await URLSession.shared.data(for: request)
        let movies = try JSONDecoder().decode(TrendMovies.self, from: data)
        return movies.results
    }

    func getNowPlayingMovies() async throws -> [NowPlayingMovie] {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1") else {
            throw URLError(.badURL)
        }
        guard let token = ProcessInfo.processInfo.environment["MOVIE_TOKEN"] else {
            print("not found token")
            throw URLError(.badURL)
        }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        let (data, _) = try await URLSession.shared.data(for: request)
        let movies = try JSONDecoder().decode(NowPlayingMovies.self, from: data)
        return movies.results
    }
}
