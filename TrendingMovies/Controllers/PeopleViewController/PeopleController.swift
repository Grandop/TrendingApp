//
//  PeopleController.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 04/12/22.
//

import UIKit

class PeopleController: UIViewController {

    @IBOutlet weak var peopleTableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var loaderIndicator: UIActivityIndicatorView!
    
    var people: [People] = []
    var peopleBrain = PeopleBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "People"
        showLoading()
        setupStyleView()
        peopleTableView.delegate = self
        peopleTableView.dataSource = self
        peopleBrain.peopleDelegate = self
        peopleBrain.getApiPeople()
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
