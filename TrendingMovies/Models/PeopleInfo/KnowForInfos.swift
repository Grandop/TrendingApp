//
//  KnowForInfos.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 04/12/22.
//

import Foundation

struct KnowForInfos: Codable {
    let title: String
    let voteAverage: Double
    let voteCount: Int
    let releaseDate: String
    let posterPath: String
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case overview
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case releaseDate = "release_date"
        case posterPath =  "poster_path"
    }
}
