//
//  TvShowsExtension.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 04/12/22.
//

import Foundation
import UIKit


//MARK: UITableViewDataSource
extension TvShowsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tvShows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! XibCustomCell
        
        cell.tvShowConfigCell(tvShow: tvShows[indexPath.row])
        
        return cell
    }
    
    
}

//MARK: TvShowsBrainDelegate
extension TvShowsController: TvShowsBrainDelegate {
    func tvShowRequestSuccess(tvShowData: TvShowsResult?) {
        DispatchQueue.main.async {
            self.hideLoading()
            self.tvShows = tvShowData!.results
            self.tvShowsTableView.reloadData()
        }
    }
    
    func tvShowRequestFail(error: Error) {
        DispatchQueue.main.async {
            self.hideLoading()
        }
    }
    
    
}
