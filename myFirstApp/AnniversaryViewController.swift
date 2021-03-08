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
    let titleView = UIView()
    let annivTitle = UILabel()
    let dismissButton = UIButton()
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableview.frame = CGRect()
        tableview.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.height-100)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        view.addSubview(tableview)
        
        tableview.translatesAutoresizingMaskIntoConstraints = false
        initTitle()
        addConstraints()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //self.tableview.reloadData()
    }
    private func addConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
//            tableview.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
//            tableview.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
//            tableview.heightAnchor.constraint(equalTo: safeArea.heightAnchor),
            
            titleView.topAnchor.constraint(equalTo: view.topAnchor),
            titleView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            titleView.bottomAnchor.constraint(equalTo: safeArea.topAnchor, constant: 52),
            //titleView.heightAnchor.constraint(equalToConstant: 56),
            
            annivTitle.topAnchor.constraint(equalTo: safeArea.topAnchor),
            annivTitle.bottomAnchor.constraint(equalTo: titleView.bottomAnchor),
            annivTitle.centerXAnchor.constraint(equalTo: titleView.centerXAnchor),
            //annivTitle.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            
            //dismissButton.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            dismissButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            dismissButton.topAnchor.constraint(equalTo: safeArea.topAnchor),
            dismissButton.bottomAnchor.constraint(equalTo: titleView.bottomAnchor)
        ])
    }
    
    func initTitle() {
        titleView.backgroundColor = .darkGray
        annivTitle.textAlignment = .center
        annivTitle.font = UIFont.systemFont(ofSize: 20)
        annivTitle.textColor = .white
        annivTitle.text = "기념일"
        dismissButton.backgroundColor = .clear
        dismissButton.setTitle("닫기", for: .normal)
        dismissButton.setTitleColor(UIColor.white, for: .normal)
        dismissButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        dismissButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        view.addSubview(titleView)
        view.addSubview(annivTitle)
        view.addSubview(dismissButton)
        view.subviews.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            view.sizeToFit()
        }
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
    
    @objc func cancel(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
