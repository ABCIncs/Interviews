//
//  TabViewController.swift
//  iOS Code Challenge
//
//  Created by Cédric Bahirwe on 03/11/2022.
//  Copyright © 2022 Geektastic. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {
    private let monumentsStore = MonumentsDatabase.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
    }

    private func setUpTabs() {
        let tabOne = MapViewController(monumentsStore)
        let tabOneBarItem = UITabBarItem(title: "Map",
                                         image: UIImage(named: "map.tab.item"),
                                         selectedImage:UIImage(named: "map.tab.item"))

        tabOne.tabBarItem = tabOneBarItem

        let tabTwo = ListViewController(monumentsStore)
        let tabTwoBarItem2 = UITabBarItem(title: "List",
                                          image: UIImage(named: "list.tab.item"),
                                          selectedImage:UIImage(named: "list.tab.item"))

        tabTwo.tabBarItem = tabTwoBarItem2

        self.viewControllers = [tabOne, tabTwo]
    }
}
