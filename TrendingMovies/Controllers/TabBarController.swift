//
//  TabBarController.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 04/12/22.
//

import UIKit

class TabBarController: UITabBarController {
    
    @IBInspectable var initialIndex: Int = 0
    @IBOutlet weak var TabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers?[initialIndex].tabBarController?.tabBar.tintColor = #colorLiteral(red: 0.5919482112, green: 0.8929846287, blue: 0.9768673778, alpha: 1)
        selectedIndex = initialIndex
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let index = tabBar.items?.firstIndex(of: item) ?? 0
        
        switch index {
        case 0:
            viewControllers?[index].tabBarController?.tabBar.tintColor = #colorLiteral(red: 0.5919482112, green: 0.8929846287, blue: 0.9768673778, alpha: 1)
        case 1:
            viewControllers?[index].tabBarController?.tabBar.tintColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        case 2:
            viewControllers?[index].tabBarController?.tabBar.tintColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        default:
            print("..")
        }
        
    }
    
}
