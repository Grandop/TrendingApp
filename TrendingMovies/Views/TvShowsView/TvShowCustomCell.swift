//
//  TvShowCustomCell.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 04/12/22.
//

import UIKit

protocol TvShowCustomCellDelegate {
    func stopLoader()
}

class TvShowCustomCell: UITableViewCell {

    @IBOutlet weak var background: UIView!
    @IBOutlet weak var tvShowPoster: UIImageView!
    @IBOutlet weak var tvShowName: UILabel!
    @IBOutlet weak var releaseDateTvShow: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var voteCountLabel: UILabel!
    @IBOutlet weak var tvShowOverview: UILabel!
    @IBOutlet weak var imageLoaderIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        background.layer.cornerRadius = 15
        tvShowPoster.layer.cornerRadius = 12
    }

    func tvShowConfigCell(tvShow: TvShows) {
        imageLoaderIndicator.startAnimating()
        tvShowPoster.loadFrom(UrlAddress: tvShow.tvShowImageURL, completionHandler: {
            self.imageLoaderIndicator.stopAnimating()
        })
        tvShowName.text = tvShow.name
        releaseDateTvShow.text = tvShow.formatReleaseDateTvShows()
        voteAverageLabel.text = String(tvShow.voteAverage)
        voteCountLabel.text = String(tvShow.voteCount)
        tvShowOverview.text = tvShow.overview
    }
    

}

