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

// MARK: - NowPlayingMovie

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

// MARK: - MovieDetail

// https://developer.themoviedb.org/reference/movie-details

struct MovieDetail: Codable {
    let backdropPath: String
    let posterPath: String
    let genres: [Genre]
    let homepage: String
    let id: Int
    let overview: String
    let originalLanguage: String
    let releaseDate: String
    let runtime: Int
    let status, title: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case genres, homepage, id
        case overview
        case originalLanguage = "original_language"
        case releaseDate = "release_date"
        case runtime, status, title
        case voteAverage = "vote_average"
    }
}

// MARK: - Genre

struct Genre: Codable {
    let id: Int
    let name: String
}

// MARK: - Credits

// https://developer.themoviedb.org/reference/movie-credits

struct Credits: Codable {
    let id: Int
    let cast: [Cast]
}

// MARK: - Cast

struct Cast: Codable {
    let id: Int
    let name: String
    let profilePath: String?
    let order: Int

    enum CodingKeys: String, CodingKey {
        case id, name
        case profilePath = "profile_path"
        case order
    }
}

// MARK: - Recommendations

// https://developer.themoviedb.org/reference/movie-recommendations
struct Recommendations: Codable {
    let page: Int
    let results: [Recommendation]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Recommendation

struct Recommendation: Codable {
    let id: Int
    let posterPath: String
    let title: String
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case title
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - PopularMovies

// https://developer.themoviedb.org/reference/movie-popular-list
struct PopularMovies: Codable {
    let page: Int
    let results: [TopMovie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - TopRatedMovies

// https://developer.themoviedb.org/reference/movie-top-rated-list
struct TopRatedMovies: Codable {
    let page: Int
    let results: [TopMovie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - TopMovie

struct TopMovie: Codable {
    let id: Int
    let posterPath, releaseDate, title: String

    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
    }
}

// MARK: - SearchMovies

// https://developer.themoviedb.org/reference/search-movie
struct SearchMovies: Codable {
    let page: Int
    let results: [SearchMovie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - SearchMovie

struct SearchMovie: Codable {
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
