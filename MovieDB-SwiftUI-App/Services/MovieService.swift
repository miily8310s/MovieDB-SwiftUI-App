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

    func getMovieDetail(id: Int) async throws -> MovieDetail {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?language=en-US") else {
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
        let movie = try JSONDecoder().decode(MovieDetail.self, from: data)
        return movie
    }

    func getCastById(id: Int) async throws -> [Cast] {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)/credits?language=en-US") else {
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
        let movie = try JSONDecoder().decode(Credits.self, from: data)
        return movie.cast
    }

    func getRecommendationsById(id: Int) async throws -> [Recommendation] {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)/recommendations?language=en-US") else {
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
        let movie = try JSONDecoder().decode(Recommendations.self, from: data)
        return movie.results
    }
}
