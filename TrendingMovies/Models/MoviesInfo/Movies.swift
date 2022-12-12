//
//  Movies.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 02/12/22.
//

import Foundation
 

struct Movies: Codable {
    let title: String
    let voteAverage: Double
    let voteCount: Int
    let releaseDate: Date
    let posterPath: String
    let overview: String
    var imageURL: String {
        let imgURL = "https://image.tmdb.org/t/p/w500"
        return imgURL + posterPath
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case overview
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case releaseDate = "release_date"
        case posterPath = "poster_path"
    }
    
    func formatReleaseDateMovies() -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = "dd/MM/yyyy"
        return dateformat.string(from: self.releaseDate)
    }
}
