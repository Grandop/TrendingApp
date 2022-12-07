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
    
    @IBOutlet weak var imageLoader: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        background.layer.cornerRadius = 15
        moviePoster.layer.cornerRadius = 12
    }
    
    func configPeopleKnownForMovie(knownFor: KnownForInfo) {
        imageLoader.startAnimating()
        moviePoster.loadFrom(UrlAddress: knownFor.knownForMovieImgUrl, completionHandler: {
            self.imageLoader.stopAnimating()
        })
        
        movieName.text = knownFor.title
        releaseDate.text = knownFor.formatReleaseDateKnownForMovie()
    
        if movieName.text == nil {
            movieName.text = knownFor.name
        }
        
        if  releaseDate.text == nil {
            releaseDate.text = knownFor.formatReleaseDateKnownForTvShow()
        }
        voteAverageLabel.text = String(knownFor.voteAverage ?? 0.0)
        voteCountLabel.text = String(knownFor.voteCount ?? 0)
        movieOverview.text = knownFor.overview
        
    }
}
