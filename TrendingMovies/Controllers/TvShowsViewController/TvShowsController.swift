//
//  TvShowsController.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 04/12/22.
//

import UIKit

class TvShowsController: UIViewController {

    @IBOutlet weak var tvShowsTableView: UITableView!
    
    var tvShows: [TvShows] = []
    var tvShowsBrain = TvShowsBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tv Shows"
        tvShowsTableView.dataSource = self
        tvShowsBrain.tvShowDelegate = self
        tvShowsBrain.getTvShowsApi()
       
    }

}
