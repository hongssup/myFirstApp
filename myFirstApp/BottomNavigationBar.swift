//
//  BottomNavigationBar.swift
//  myFirstApp
//
//  Created by SeoYeon on 2021/01/22.
//

import UIKit
import Foundation
import MaterialComponents
import FontAwesome_swift

class BottomNavigation: UITabBarController, MDCBottomNavigationBarDelegate {
    let bottomNavBar = MDCBottomNavigationBar()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        let view1 = HomeViewController()
        let view2 = CalendarView()
        let view3 = UIViewController()
        let image1 = UIImage.fontAwesomeIcon(name: .home, style: .solid, textColor: .darkGray, size: CGSize(width: 30, height: 30))
        let image2 = UIImage.fontAwesomeIcon(name: .calendarAlt, style: .regular, textColor: .darkGray, size: CGSize(width: 30, height: 30))
        let image3 = UIImage.fontAwesomeIcon(name: .listAlt, style: .regular, textColor: .darkGray, size: CGSize(width: 30, height: 30))
        
        view1.tabBarItem = UITabBarItem(title: "Home", image: image1, tag: 0)
        view2.tabBarItem = UITabBarItem(title: "Calendar", image: image2, tag: 1)
        view3.tabBarItem = UITabBarItem(title: "WishList", image: image3, tag: 2)
        view3.tabBarItem.badgeValue = "2"
        view3.tabBarItem.badgeColor = MDCPalette.deepOrange.tint500
        UITabBar.appearance().tintColor = MDCPalette.deepOrange.tint300
        UITabBar.appearance().unselectedItemTintColor = .systemGray
        
        bottomNavBar.unselectedItemTintColor = .systemGray
        bottomNavBar.selectedItemTintColor = MDCPalette.deepOrange.tint300
        self.viewControllers = [view1, view2, view3]
    }
}


