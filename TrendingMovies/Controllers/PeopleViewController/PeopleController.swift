//
//  PeopleController.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 04/12/22.
//

import UIKit

class PeopleController: UIViewController {

    @IBOutlet weak var peopleTableView: UITableView!
    
    var people: [People] = []
    var peopleBrain = PeopleBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "People"
        peopleTableView.delegate = self
        peopleTableView.dataSource = self
        peopleBrain.peopleDelegate = self
        peopleBrain.getApiPeople()
    }
}
