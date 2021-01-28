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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Wish List"
        self.collectionView?.register(MDCCollectionViewTextCell.self, forCellWithReuseIdentifier: reusableIdentifierItem)
        self.styler.cellStyle = .card
        wishList = ["먹고 싶은거", "갖고 싶은거", "하고 싶은거", "가고 싶은 곳"]
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return wishList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableIdentifierItem, for: indexPath)
        
        if let cell = cell as? MDCCollectionViewTextCell {
            cell.textLabel?.text = wishList[indexPath.item]
            cell.textLabel?.textColor = UIColor(red: 26/255, green: 24/255, blue: 24/255, alpha: 1)
        }
        return cell 
    }
}
