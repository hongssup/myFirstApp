//
//  BottomNavigation.swift
//  myFirstApp
//
//  Created by SeoYeon on 2021/01/20.
//

import UIKit
import Foundation
import MaterialComponents
import FontAwesome_swift

class BottomNavigation: UIViewController {

    @objc let containerScheme = MDCContainerScheme()
    let bottomNavBar = MDCBottomNavigationBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        setBottomNavBarItems()
    }
    
    func setBottomNavBarItems() {
        let image1 = UIImage.fontAwesomeIcon(name: .home, style: .solid, textColor: .darkGray, size: CGSize(width: 30, height: 30))
        let tabBarItem1 = UITabBarItem(title: "Home", image: image1, tag: 0)
        let image2 = UIImage.fontAwesomeIcon(name: .calendarAlt, style: .regular, textColor: .darkGray, size: CGSize(width: 30, height: 30))
        let tabBarItem2 = UITabBarItem(title: "Calendar", image: image2, tag: 1)
        let image3 = UIImage.fontAwesomeIcon(name: .listAlt, style: .regular, textColor: .darkGray, size: CGSize(width: 30, height: 30))
        let tabBarItem3 = UITabBarItem(title: "WishList", image: image3, tag: 1)
        bottomNavBar.items = [tabBarItem1, tabBarItem2, tabBarItem3]
        bottomNavBar.selectedItem = tabBarItem1
        view.addSubview(bottomNavBar)
        bottomNavBar.applyPrimaryTheme(withScheme: containerScheme)
        //bottomNavBar.titleVisibility = .never
        bottomNavBar.itemTitleFont = .systemFont(ofSize: 9)
        //bottomNavBar.alignment = .centered
        bottomNavBar.backgroundColor = .white
        bottomNavBar.unselectedItemTintColor = .systemGray
        bottomNavBar.selectedItemTintColor = MDCPalette.deepOrange.tint300
        //bottomNavBar.enableRippleBehavior = false
    }
    
    func layoutBottomNavBar() {
        let size = bottomNavBar.sizeThatFits(view.bounds.size)
        var bottomNavBarFrame = CGRect(x: 0,
                                       y: view.bounds.height - size.height,
                                       width: size.width,
                                       height: size.height)
        bottomNavBar.frame = bottomNavBarFrame
    }
    override func viewWillLayoutSubviews() {
      super.viewWillLayoutSubviews()
      layoutBottomNavBar()
    }
    

}

