//
//  People.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 04/12/22.
//

import Foundation

struct People: Codable {
    let name: String
    let popularity: Double
    let knownForDepartment: String  
    let profilePath: String?
    let knownFor: [KnownForInfo]
    var peopleImageURL: String {
        let imgURL = "https://image.tmdb.org/t/p/w500"
        
        return imgURL + (profilePath ?? "")
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case popularity
        case knownForDepartment = "known_for_department"
        case profilePath = "profile_path"
        case knownFor = "known_for"
    }
    
    
}
