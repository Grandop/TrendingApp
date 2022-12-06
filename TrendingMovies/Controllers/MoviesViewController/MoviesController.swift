//
//  ViewController.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 02/12/22.
//

import UIKit

class MoviesController: UIViewController {
    @IBOutlet weak var moviesTableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var loaderIndicator: UIActivityIndicatorView!
    
    var movies: [Movies] = []
    var moviesBrain = MoviesBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movies"
        showLoading()
        setupStyleView()
        moviesTableView.dataSource = self
        moviesBrain.delegate = self
        moviesBrain.getApi()
    }
    
    func setupStyleView() {
        loadingView.layer.cornerRadius = 15
        loadingView.layer.borderWidth = 1
    }
    
    func showLoading() {
        self.loadingView.isHidden = false
        self.loaderIndicator.startAnimating()
        self.view.isUserInteractionEnabled = false
    }
    
    func hideLoading() {
        self.loadingView.isHidden = true
        self.loaderIndicator.stopAnimating()
        self.view.isUserInteractionEnabled = true
    }
    
}

