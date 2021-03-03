//
//  WishListView.swift
//  myFirstApp
//
//  Created by SeoYeon on 2021/01/28.
//

import Foundation
import UIKit
import MaterialComponents

class WishListViewController:MDCCollectionViewController {
    
    let reusableIdentifierItem = "itemCellIdentifier"
    var wishList: [String] = []
    var iconList: [String] = []
    var colorList: [UIColor] = []
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    override var prefersStatusBarHidden: Bool { return false }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barStyle = .black  //difference with barTintColor?
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationItem.title = "Wish List"
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.collectionView?.register(ListCell.self, forCellWithReuseIdentifier: reusableIdentifierItem)
        self.styler.cellStyle = .card
        wishList = ["먹고 싶은거", "갖고 싶은거", "하고 싶은거", "가고 싶은 곳"]
        iconList = [.fontAwesomeIcon(name: .utensils), .fontAwesomeIcon(name: .gift), .fontAwesomeIcon(name: .pepperHot), .fontAwesomeIcon(name: .car)]
        colorList = [MDCPalette.red.tint300, MDCPalette.purple.tint300, MDCPalette.deepPurple.tint300, MDCPalette.indigo.tint300]
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return wishList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableIdentifierItem, for: indexPath)
        
        if let cell = cell as? ListCell {
            cell.listLabel.text = wishList[indexPath.item]
            cell.listLabel.textColor = UIColor(red: 26/255, green: 24/255, blue: 24/255, alpha: 1)
            cell.circle.backgroundColor = colorList[indexPath.item]
            cell.listIcon.text = iconList[indexPath.item]
            cell.listIcon.textColor = UIColor.white
            cell.countLabel.text = "0"
            
        }
        return cell 
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellHeightAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let listTitle = wishList[indexPath.item]

        let viewController = ListViewController(title: listTitle)
        self.navigationController?.pushViewController(viewController, animated: true)
        //self.present(viewController, animated: true, completion: nil)
        //show(viewController, sender: self)
    }
}
