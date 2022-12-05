//
//  ViewController.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 02/12/22.
//

import UIKit

class MoviesController: UIViewController {
    @IBOutlet weak var moviesTableView: UITableView!
    
    var movies: [Movies] = []
    var moviesBrain = MoviesBrain()
    
    override func viewDidLoad() {
        
        self.title = "Movies"
        super.viewDidLoad()
        moviesTableView.dataSource = self
        moviesBrain.delegate = self
        moviesBrain.getApi()
        
    }


}

