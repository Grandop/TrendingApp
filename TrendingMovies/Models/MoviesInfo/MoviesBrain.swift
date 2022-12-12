//
//  MoviesBrain.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 02/12/22.
//

import Foundation

protocol MovieBrainDelegate {
    func movieRequestSuccess(movieData: MovieResults?)
    func movieRequestFail(error: Error)
}

struct MoviesBrain {
    
    var delegate: MovieBrainDelegate?
    
    func getApi() {
        print("olá")
        let url = URL(string: "https://api.themoviedb.org/3/trending/movie/week?api_key=d8ab08a45dfeb6ee6317a10b502a476a")
        
        if let url = url {
            let session = URLSession.shared
            
            let task = session.dataTask(with: url) { data, response, error in
                print(response)
                
                if error == nil {
                    if data != nil {
                        let movies = self.decodeJSON(data!)
                        self.delegate?.movieRequestSuccess(movieData: movies)
                    }
                }
                else {
                    self.delegate?.movieRequestFail(error: error!)
                }
            }
            task.resume()
        }
        
    }
    
    func decodeJSON(_ dataOfMovies: Data) -> MovieResults? {
        let decoder = JSONDecoder()
       
        do {
            
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "yyyy-MM-dd"
            decoder.dateDecodingStrategy = .formatted(dateFormat)
            
            let movies = try decoder.decode(MovieResults.self, from: dataOfMovies)
            
            return movies
        }
        catch {
            self.delegate?.movieRequestFail(error: error)
            print(error)
            return nil
        }
    }

}

