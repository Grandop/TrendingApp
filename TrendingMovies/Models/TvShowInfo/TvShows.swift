//
//  TvShows.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 04/12/22.
//

import Foundation

struct TvShows: Codable {
    let name: String
    let voteAverage: Double
    let voteCount: Int
    let firstAirDate: Date
    let overview: String
    let posterPath: String
    var tvShowImageURL: String {
        let imgURL = "https://image.tmdb.org/t/p/w500"
        
        return imgURL + posterPath
    }
    
    
    enum CodingKeys: String, CodingKey {
        case name
        case overview
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case firstAirDate = "first_air_date"
        case posterPath = "poster_path"
    }
    
    func formatReleaseDateTvShows() -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = "dd/MM/yyyy"
        return dateformat.string(from: self.firstAirDate)
    }
}
