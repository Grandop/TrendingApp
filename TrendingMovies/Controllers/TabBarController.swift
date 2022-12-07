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
        selectedIndex = initialIndex
    }
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        if item.tag == 0 {
//            item.image?.withTintColor(.green)
//        } else if item.tag == 1 {
//            item.image?.withTintColor(.purple)
//        }
//    }
//
//    override func tabBar(_ tabBar: UITabBar, didBeginCustomizing items: [UITabBarItem]) {
//        for item in items {
//            if item.tag == 0 {
//                item.image?.withTintColor(.green)
//            }
//        }
//    }
    
}
