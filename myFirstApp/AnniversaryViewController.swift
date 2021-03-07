//
//  AnniversaryViewController.swift
//  myFirstApp
//
//  Created by SeoYeon on 2021/03/03.
//

import Foundation
import UIKit

class anniversaryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableview = UITableView()
    var listItems = ["1", "2", "3", "4"]
    let cellReuseIdentifier = "cell"
    
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.frame = CGRect(x: 0, y: 60, width: view.frame.width-20, height: view.frame.height-100)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        view.addSubview(tableview)
        
        tableview.translatesAutoresizingMaskIntoConstraints = false
        //addConstraints()
        initTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //self.tableview.reloadData()
    }
    private func addConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            tableview.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            tableview.heightAnchor.constraint(equalTo: safeArea.heightAnchor)
        ])
    }
    
    func initTitle() {
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 56))
        titleView.backgroundColor = .darkGray
        let annivTitle = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 56))
        annivTitle.textAlignment = .center
        annivTitle.font = UIFont.systemFont(ofSize: 20)
        annivTitle.text = "기념일"
        view.addSubview(titleView)
        view.addSubview(annivTitle)
        
        //self.navigationItem.titleView = annivTitle
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(listItems.count)
        return listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableview.dequeueReusableCell(withIdentifier: cellReuseIdentifier)! as UITableViewCell
        cell.textLabel?.text = listItems[indexPath.row]
        
        return cell
    }
}
