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
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "먹고 싶은 거"
        print("food")
        
        
    }
}
