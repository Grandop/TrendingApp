//
//  PeopleCustomCell.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 04/12/22.
//

import UIKit

class PeopleCustomCell: UITableViewCell {
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var profileActor: UIImageView!
    @IBOutlet weak var actorName: UILabel!
    @IBOutlet weak var department: UILabel!
    @IBOutlet weak var popularity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        background.layer.cornerRadius = 15
        profileActor.layer.cornerRadius = 12
    }
    
    func configPeopleCell(people: People) {
        if people.profilePath == nil {
            profileActor.image = UIImage(systemName: "person.fill")
        } else {
            profileActor.loadFrom(UrlAddress: people.peopleImageURL, completionHandler: {
                
            })
        }
        actorName.text = people.name
        department.text = people.knownForDepartment.uppercased()
        popularity.text = String(people.popularity)
    }
}
