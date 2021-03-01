//
//  FoodListViewController.swift
//  myFirstApp
//
//  Created by SeoYeon on 2021/02/24.
//

import Foundation
import UIKit
import MaterialComponents
import FirebaseDatabase

class ListViewController: MDCCollectionViewController {
    
    let ref = Database.database(url: "https://my-first-eb314-default-rtdb.firebaseio.com/").reference(withPath: "wish list")
    
    init(title: String) {
        super.init(collectionViewLayout: UICollectionViewLayout())
        UINavigationBarAppearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addTapped))
    }
    
    @objc func addTapped(sender: UIBarButtonItem) {
        
    }
}
