//
//  PeopleKnownForMovieController.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 04/12/22.
//

import UIKit

class PeopleKnownForMovieController: UIViewController{
    
    @IBOutlet weak var peopleKnownForTableView: UITableView!

    var knownForInfo: [KnownForInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Known For"
        peopleKnownForTableView.dataSource = self
    }
    
}
// MARK: UITableViewDataSource
extension PeopleKnownForMovieController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return knownForInfo.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "peopleKnownForMovie", for: indexPath) as! PeopleKnownForMovieCell
        
        cell.configPeopleKnownForMovie(knownFor: knownForInfo[indexPath.row])
        
        return cell
    }


}
