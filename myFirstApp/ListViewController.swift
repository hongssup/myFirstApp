//
//  FoodListViewController.swift
//  myFirstApp
//
//  Created by SeoYeon on 2021/02/24.
//

import Foundation
import UIKit
import MaterialComponents

class ListViewController: MDCCollectionViewController {
    
    init(title: String) {
        super.init(collectionViewLayout: UICollectionViewLayout())
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
