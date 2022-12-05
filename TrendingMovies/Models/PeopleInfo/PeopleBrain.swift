//
//  PeopleBrain.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 04/12/22.
//

import Foundation

protocol PeopleBrainDelegate {
    func peopleRequestSuccess(peopleData: PeopleResult?)
    func peopleRequestFail(error: Error)
}

struct PeopleBrain {
    
    var peopleDelegate: PeopleBrainDelegate?
    
    func getApiPeople() {
        let url = URL(string: "https://api.themoviedb.org/3/trending/person/week?api_key=d8ab08a45dfeb6ee6317a10b502a476a")
        
        if let url = url {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { data, response, error in
                
                
                if error == nil {
                    if data != nil {
                        let people = self.parseJSON(data!)
                        self.peopleDelegate?.peopleRequestSuccess(peopleData: people)
                    }
                } else {
                    self.peopleDelegate?.peopleRequestFail(error: error!)
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(_ dataOfPeople: Data) -> PeopleResult? {
        let decoder = JSONDecoder()
        
        do {
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "yyyy-MM-dd"
            decoder.dateDecodingStrategy = .formatted(dateFormat)
            
            let people = try decoder.decode(PeopleResult.self, from: dataOfPeople)
            return people
        } catch {
            self.peopleDelegate?.peopleRequestFail(error: error)
            print(error)
            return nil
        }
    }
}
