//
//  TabBarController.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 04/12/22.
//

import UIKit

class TabBarController: UITabBarController {

    @IBInspectable var initialIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = initialIndex
    
    }
    
}
