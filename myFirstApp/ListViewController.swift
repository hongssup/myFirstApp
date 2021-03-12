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

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let ref = Database.database(url: "https://my-first-eb314-default-rtdb.firebaseio.com/").reference(withPath: "wish list")
    var listTableView = UITableView()
    var addListViewController: AddListViewController?
    public var listItems:[String] = ["l"]
    let cellReuseIdentifier = "cell"
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    init(title: String) {
        super.init(nibName: nil, bundle: nil)
        self.navigationController?.navigationBar.barTintColor = MDCPalette.deepOrange.tint300
        //self.navigationController?.navigationBar.tintColor = UIColor.white
        
        //navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.frame = CGRect(x: 0, y: 40, width: view.frame.width, height: view.frame.height-100)
        self.listTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        listTableView.delegate = self
        listTableView.dataSource = self
        self.view.addSubview(listTableView)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addTapped))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(appDelegate.itemsList)
        //print("new \(listItems)")
        listTableView.reloadData()

    }
    
    @objc func addTapped(sender: UIBarButtonItem) {
        let viewController = AddListViewController()
        self.present(viewController, animated: true, completion: nil)
        //show(viewController, sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return listItems.count
        return appDelegate.itemsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.listTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)! as UITableViewCell
        //cell.textLabel?.text = self.listItems[indexPath.row]
        cell.textLabel?.text = self.appDelegate.itemsList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("You tapped cell number \(indexPath.row).")
        }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

            if editingStyle == .delete {

                //listItems.remove(at: indexPath.row)
                appDelegate.itemsList.remove(at: indexPath.row)
                listTableView.deleteRows(at: [indexPath], with: .fade)

            } else if editingStyle == .insert {
                //listItems.append(addListViewController?.text ?? "")
                //listTableView.insertRows(at: [indexPath], with: .fade)
            }
        }
//    public func addList(_ text: String) {
//        print("addlist")
//        let newInexPath = IndexPath(row: 0, section: 0)
//        listItems.append(text)
//        print(listItems)
//        listTableView.insertRows(at: [newInexPath], with: .fade)
//        listTableView.reloadData()
//    }
}


