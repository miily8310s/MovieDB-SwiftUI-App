//
//  Movie.swift
//  MovieDB-SwiftUI-App
//
//  Created by erika yoshikawa on 2024/06/03.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let trendMovies = try? JSONDecoder().decode(TrendMovies.self, from: jsonData)

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
    let backdropPath: String
    let id: Int
    let originalTitle, overview, posterPath: String
    let mediaType: MediaType
    let adult: Bool
    let title, originalLanguage: String
    let genreIDS: [Int]
    let popularity: Double
    let releaseDate: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case adult, title
        case originalLanguage = "original_language"
        case genreIDS = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum MediaType: String, Codable {
    case movie
}
