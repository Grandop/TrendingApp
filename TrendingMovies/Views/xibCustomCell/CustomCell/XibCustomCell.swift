//
//  XibCustomCell.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 12/12/22.
//

import UIKit

class XibCustomCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var loaderIndicator: UIActivityIndicatorView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateInformation: UILabel!
    @IBOutlet weak var voteAverage: UILabel!
    @IBOutlet weak var voteCount: UILabel!
    @IBOutlet weak var overview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = 15
        posterImage.layer.cornerRadius = 12
    }

    func configCellMovie(movie: Movies) {
        bgView.backgroundColor = UIColor(red: 0/255, green: 158/255, blue: 251/255, alpha: 0.28)
        loaderIndicator.startAnimating()
        posterImage.loadFrom(UrlAddress: movie.imageURL, completionHandler: {
            self.loaderIndicator.stopAnimating()
        })
        nameLabel.text = movie.title
        dateInformation.text = movie.formatReleaseDateMovies()
        voteAverage.text = String(movie.voteAverage)
        voteCount.text = String(movie.voteCount)
        overview.text = movie.overview
    }
    
    func tvShowConfigCell(tvShow: TvShows) {
        bgView.backgroundColor = UIColor(red: 255/255, green: 154/255, blue: 233/255, alpha: 0.5)
        loaderIndicator.startAnimating()
        posterImage.loadFrom(UrlAddress: tvShow.tvShowImageURL, completionHandler: {
            self.loaderIndicator.stopAnimating()
        })
        nameLabel.text = tvShow.name
        dateInformation.text = tvShow.formatReleaseDateTvShows()
        voteAverage.text = String(tvShow.voteAverage)
        voteCount.text = String(tvShow.voteCount)
        overview.text = tvShow.overview
    }
    
    func configPeopleKnownForMovie(knownFor: KnownForInfo) {
        bgView.backgroundColor = UIColor(red: 181/255, green: 255/255, blue: 181/255, alpha: 0.5)
        loaderIndicator.startAnimating()
        posterImage.loadFrom(UrlAddress: knownFor.knownForMovieImgUrl, completionHandler: {
            self.loaderIndicator.stopAnimating()
        })
        
        nameLabel.text = knownFor.title
        if nameLabel.text == nil {
            nameLabel.text = knownFor.name
        }
        
        dateInformation.text = knownFor.formatReleaseDateKnownForMovie()
        if  dateInformation.text == "" {
            dateInformation.text = knownFor.formatReleaseDateKnownForTvShow()
        }
        
        voteAverage.text = String(knownFor.voteAverage ?? 0.0)
        voteCount.text = String(knownFor.voteCount ?? 0)
        overview.text = knownFor.overview
    }
    
}
