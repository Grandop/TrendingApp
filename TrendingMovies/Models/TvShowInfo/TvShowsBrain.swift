//
//  TvShowsBrain.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 04/12/22.
//

import Foundation

protocol TvShowsBrainDelegate {
    func tvShowRequestSuccess(tvShowData: TvShowsResult?)
    func tvShowRequestFail(error: Error)
}

struct TvShowsBrain {
    
    var tvShowDelegate : TvShowsBrainDelegate?
    
    func getTvShowsApi() {
        let url = URL(string: "https://api.themoviedb.org/3/trending/tv/week?api_key=d8ab08a45dfeb6ee6317a10b502a476a")
        if let url = url {
            let session = URLSession.shared
            
            let task = session.dataTask(with: url) { data, response, error in
                
                if error == nil {
                    if data != nil {
                        let tvShows = self.decodeJSON(data!)
                        self.tvShowDelegate?.tvShowRequestSuccess(tvShowData: tvShows)
                    }
                }
                else {
                    self.tvShowDelegate?.tvShowRequestFail(error: error!)
                }
            }
            
            task.resume()
        }
    }
    
    func decodeJSON(_ dataOfTvShows: Data) -> TvShowsResult? {
        let decoder = JSONDecoder()
        
        do {
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "yyyy-MM-dd"
            decoder.dateDecodingStrategy = .formatted(dateFormat)
            
            let tvShows = try decoder.decode(TvShowsResult.self, from: dataOfTvShows)
            return tvShows
        }
        catch {
            self.tvShowDelegate?.tvShowRequestFail(error: error)
            print(error)
            return nil
        }
    }
    
}
