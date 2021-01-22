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
        let view1 = UIViewController()
        let view2 = UIViewController()
        view2.view.backgroundColor = .cyan
        let view3 = UIViewController()
        let image1 = UIImage.fontAwesomeIcon(name: .home, style: .solid, textColor: .darkGray, size: CGSize(width: 30, height: 30))
        let image2 = UIImage.fontAwesomeIcon(name: .calendarAlt, style: .regular, textColor: .darkGray, size: CGSize(width: 30, height: 30))
        let image3 = UIImage.fontAwesomeIcon(name: .listAlt, style: .regular, textColor: .darkGray, size: CGSize(width: 30, height: 30))
        
        view1.tabBarItem = UITabBarItem(title: "Home", image: image1, tag: 0)
        view2.tabBarItem = UITabBarItem(title: "Calendar", image: image2, tag: 1)
        view3.tabBarItem = UITabBarItem(title: "WishList", image: image3, tag: 2)
        view3.tabBarItem.badgeValue = "2"
        view3.tabBarItem.badgeColor = MDCPalette.deepOrange.tint500
        //let item1 = view1.tabBarItem
        
        bottomNavBar.unselectedItemTintColor = .systemGray
        bottomNavBar.selectedItemTintColor = MDCPalette.deepOrange.tint300
        self.viewControllers = [view1, view2, view3]
    }
}

//class BottomNavigation: UITabBarController, MDCBottomNavigationBarDelegate {
//
//    //@objc let containerScheme = MDCContainerScheme()
//    let bottomNavBar = MDCBottomNavigationBar()
//    //let bottomNavBarcontroller = MDCBottomNavigationBarController()
//    let viewController1 = UIViewController()
//    let viewController2 = UIViewController()
//    let viewController3 = UIViewController()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemGray6
//
//        setBottomNavBarItems()
////        let viewController1 = UIViewController()
////        let viewController2 = UIViewController()
////        //viewController2.view.backgroundColor = .cyan
////        let viewController3 = UIViewController()
//        self.viewControllers = [viewController1, viewController2, viewController3]
//
//
//        //bottomNavBar.delegate?.bottomNavigationBar?(bottomNavBar, didSelect: tabBarItem2)
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        //self.navigationController?.setNavigationBarHidden(true, animated: animated)
//    }
//
//    func setBottomNavBarItems() {
//
//        let image1 = UIImage.fontAwesomeIcon(name: .home, style: .solid, textColor: .darkGray, size: CGSize(width: 30, height: 30))
//        let image2 = UIImage.fontAwesomeIcon(name: .calendarAlt, style: .regular, textColor: .darkGray, size: CGSize(width: 30, height: 30))
//        let image3 = UIImage.fontAwesomeIcon(name: .listAlt, style: .regular, textColor: .darkGray, size: CGSize(width: 30, height: 30))
//        let tabBarItem1 = UITabBarItem(title: "Home", image: image1, tag: 0)
//        let tabBarItem2 = UITabBarItem(title: "Calendar", image: image2, tag: 1)
//        let tabBarItem3 = UITabBarItem(title: "WishList", image: image3, tag: 2)
//        tabBarItem3.badgeValue = "2"
//        tabBarItem3.badgeColor = MDCPalette.deepOrange.tint500
//        bottomNavBar.items = [tabBarItem1, tabBarItem2, tabBarItem3]
//        bottomNavBar.selectedItem = tabBarItem1
//        view.addSubview(bottomNavBar)
//        //bottomNavBar.applyPrimaryTheme(withScheme: containerScheme)
//        //bottomNavBar.titleVisibility = .never
//        bottomNavBar.itemTitleFont = .systemFont(ofSize: 9)
//        //bottomNavBar.alignment = .centered
//        bottomNavBar.backgroundColor = .white
//        bottomNavBar.unselectedItemTintColor = .systemGray
//        bottomNavBar.selectedItemTintColor = MDCPalette.deepOrange.tint300
//        //bottomNavBar.enableRippleBehavior = false
//    }
//
//    func bottomNavigationBar(_ bottomNavigationBar: MDCBottomNavigationBar, didSelect item: UITabBarItem) {
//        self.selectedIndex = item.tag
//        self.navigationController?.viewControllers[item.tag]
//        viewController2.view.backgroundColor = .cyan
//    }
//
//    func layoutBottomNavBar() {
//        let size = bottomNavBar.sizeThatFits(view.bounds.size)
//        var bottomNavBarFrame = CGRect(x: 0,
//                                       y: view.bounds.height - size.height,
//                                       width: size.width,
//                                       height: size.height)
//        bottomNavBar.frame = bottomNavBarFrame
//    }
//
//    override func viewWillLayoutSubviews() {
//      super.viewWillLayoutSubviews()
//      layoutBottomNavBar()
//    }
//}
