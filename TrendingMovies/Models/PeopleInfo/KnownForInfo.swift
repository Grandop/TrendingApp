//
//  KnownForInfo.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 04/12/22.
//

import Foundation

struct KnownForInfo: Codable {
    let title: String?
    let overview: String?
    let posterPath: String?
    let releaseDate: Date?
    let voteAverage: Double?
    let voteCount: Int?
    var knownForMovieImgUrl: String {
        let imgURL = "https://image.tmdb.org/t/p/w500"
        
        return imgURL + (posterPath ?? "")
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount =  "vote_count"
    }
    
    func formatReleaseDateKnownFor() -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = "dd/MM/yyyy"
        
        if let releaseDate = self.releaseDate {
            return dateformat.string(from: releaseDate)
        } else {
            return ""
        }
    }
}
