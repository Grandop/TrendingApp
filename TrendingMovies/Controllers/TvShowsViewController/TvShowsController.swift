//
//  TvShowsController.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 04/12/22.
//

import UIKit

class TvShowsController: UIViewController {
    @IBOutlet weak var tvShowsTableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var loaderIndicator: UIActivityIndicatorView!
    
    var tvShows: [TvShows] = []
    var tvShowsBrain = TvShowsBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setuptvShowsTableView()
    }
    
    func setuptvShowsTableView() {
        tvShowsTableView.register(UINib(nibName: "XibCustomCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        self.title = "Tv Shows"
        showLoading()
        setupStyleView()
        tvShowsTableView.dataSource = self
        tvShowsBrain.tvShowDelegate = self
        tvShowsBrain.getTvShowsApi()
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
