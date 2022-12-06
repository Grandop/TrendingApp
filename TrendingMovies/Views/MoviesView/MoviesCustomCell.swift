//
//  MoviesCustomCell.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 02/12/22.
//

import UIKit

protocol MoviesCustomCellDelegate {
    func stopLoader()
}

class MoviesCustomCell: UITableViewCell {

    @IBOutlet weak var background: UIView!
    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var filmName: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var voteAverage: UILabel!
    @IBOutlet weak var voteCount: UILabel!
    @IBOutlet weak var filmInformation: UILabel!
    @IBOutlet weak var imageLoader: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        background.layer.cornerRadius = 15
        filmImage.layer.cornerRadius = 12
        UIImageView.imageDelegate = self
    }

    func configCell(movie: Movies) {
        imageLoader.showLoading()
        filmImage.loadFrom(UrlAddress: movie.imageURL)
        filmName.text = movie.title
        releaseDate.text = movie.formatReleaseDateMovies()
        voteAverage.text = String(movie.voteAverage)
        voteCount.text = String(movie.voteCount)
        filmInformation.text = movie.overview
    }

}

extension MoviesCustomCell: MoviesCustomCellDelegate {
    func stopLoader() {
        imageLoader.stopLoading()
    }
    
}
