//
//  Movie.swift
//  MovieDB-SwiftUI-App
//
//  Created by erika yoshikawa on 2024/06/03.
//

import Foundation

// MARK: - TrendMovies

struct TrendMovies: Codable {
    let page: Int
    let results: [TrendMovie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - TrendMovie

struct TrendMovie: Codable {
    let id: Int
    let posterPath: String
    let title: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case title
        case voteAverage = "vote_average"
    }
}

// MARK: - NowPlayingMovies

struct NowPlayingMovies: Codable {
    let dates: Dates
    let page: Int
    let results: [NowPlayingMovie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Dates

struct Dates: Codable {
    let maximum, minimum: String
}

// MARK: - Result

struct NowPlayingMovie: Codable {
    let backdropPath: String
    let id: Int
    let title: String
    let releaseDate: String

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case id
        case title
    }
}
