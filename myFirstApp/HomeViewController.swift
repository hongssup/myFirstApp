//
//  HomeViewController.swift
//  myFirstApp
//
//  Created by SeoYeon on 2021/01/26.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    let daysLabel = UILabel()
    var daysCount:Int = 0
    let calendar = Calendar.current
    let currentDate = Date()
    let dateFormatter = DateFormatter()
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateDays()
        setupViews()
        addConstraints()
    }
    
    private func setupViews() {
        view.addSubview(daysLabel)
        daysLabel.translatesAutoresizingMaskIntoConstraints = false
                
        daysLabel.font = UIFont.systemFont(ofSize: 20)
        daysLabel.textColor = .darkGray
        daysLabel.text = "\(daysCount) days"
    }
    
    private func addConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            daysLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            daysLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    func calculateDays() {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let startDate = dateFormatter.date(from: "2020-09-13")
        daysCount = days(from: startDate ?? currentDate) + 1
        let hundred = calendar.date(byAdding: .day, value: 100, to: startDate ?? currentDate)
        print(hundred)
    }
    
    func days(from date: Date) -> Int {
        return calendar.dateComponents([.day], from: date, to: currentDate).day ?? 0
    }
}
