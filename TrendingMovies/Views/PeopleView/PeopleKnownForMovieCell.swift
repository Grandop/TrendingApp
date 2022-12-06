//
//  PeopleKnownForMovieCell.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 04/12/22.
//

import UIKit

class PeopleKnownForMovieCell: UITableViewCell {

    @IBOutlet weak var background: UIView!
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var voteCountLabel: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        background.layer.cornerRadius = 15
        moviePoster.layer.cornerRadius = 12
    }
    
    func configPeopleKnownForMovie(knownFor: KnownForInfo) {
        
        moviePoster.loadFrom(UrlAddress: knownFor.knownForMovieImgUrl)
        movieName.text = knownFor.title
        releaseDate.text = knownFor.formatReleaseDateKnownFor()
        voteAverageLabel.text = String(knownFor.voteAverage ?? 0.0)
        voteCountLabel.text = String(knownFor.voteCount ?? 0)
        movieOverview.text = knownFor.overview
        
    }
}
