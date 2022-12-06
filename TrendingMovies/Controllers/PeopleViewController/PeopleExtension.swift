//
//  PeopleExtension.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 04/12/22.
//

import Foundation
import UIKit

//MARK: UITableViewDataSource
extension PeopleController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell", for: indexPath) as! PeopleCustomCell
        
        cell.configPeopleCell(people: people[indexPath.row])
        
        return cell
    }
    
}

//MARK: PeopleBrainDelegate
extension PeopleController: PeopleBrainDelegate {
    func peopleRequestSuccess(peopleData: PeopleResult?) {
        DispatchQueue.main.async {
            self.hideLoading()
            self.people = peopleData?.results ?? []
            self.peopleTableView.reloadData()
        }
    }
    
    func peopleRequestFail(error: Error) {
        DispatchQueue.main.async {
            self.hideLoading()
        }
    }
}

//MARK: UITableViewDelegate

extension PeopleController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let peopleKnownForMovieStoryBoard: UIStoryboard = UIStoryboard(name: "peopleKnownForMovie", bundle: nil) 
        
        let peopleKnownForMovieController = peopleKnownForMovieStoryBoard.instantiateViewController(withIdentifier: "KnownForPeople") as! PeopleKnownForMovieController
        
        peopleKnownForMovieController.knownForInfo = people[indexPath.row].knownFor

        self.navigationController?.pushViewController(peopleKnownForMovieController, animated: true)
        
    }
}
