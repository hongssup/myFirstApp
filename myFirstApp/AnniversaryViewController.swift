//
//  AnniversaryViewController.swift
//  myFirstApp
//
//  Created by SeoYeon on 2021/03/03.
//

import Foundation
import UIKit

class anniversaryViewController: UIViewController {
    let tableview = UITableView()
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
