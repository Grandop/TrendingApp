//
//  XibPeopleCell.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 12/12/22.
//

import UIKit

class XibPeopleCell: UITableViewCell {

    @IBOutlet weak var peopleImage: UIImageView!
    @IBOutlet weak var peopleName: UILabel!
    @IBOutlet weak var department: UILabel!
    @IBOutlet weak var votes: UILabel!
    @IBOutlet weak var background: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        background.layer.cornerRadius = 15
        peopleImage.layer.cornerRadius = 12
    }
    
    func configPeopleCell(people: People) {
        if people.profilePath == nil {
            peopleImage.image = UIImage(systemName: "person.fill")
        } else {
            peopleImage.loadFrom(UrlAddress: people.peopleImageURL, completionHandler: {
                
            })
        }
        peopleName.text = people.name
        department.text = people.knownForDepartment.uppercased()
        votes.text = String(people.popularity)
    }
    
}
