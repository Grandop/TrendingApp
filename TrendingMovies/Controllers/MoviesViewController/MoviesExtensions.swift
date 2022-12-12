//
//  Extensions.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 02/12/22.
//

import Foundation
import UIKit

//MARK: UITableViewDataSource

extension MoviesController: UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! XibCustomCell
        
        cell.configCellMovie(movie: movies[indexPath.row])
    
        return cell
        
    }
    
}

//MARK: MovieBrainDelegate

extension MoviesController: MovieBrainDelegate {
    func movieRequestSuccess(movieData: MovieResults?) {
        DispatchQueue.main.async {
            self.hideLoading()
            self.movies = movieData?.results ?? []
            self.moviesTableView.reloadData()
            
        }
    }

    func movieRequestFail(error: Error) {
        DispatchQueue.main.async {
            self.hideLoading()
        }
    }


}
