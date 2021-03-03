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
    let dateLabel = UILabel()
    var daysCount:Int = 0
    let calendar = Calendar.current
    let currentDate = Date()
    let dateFormatter = DateFormatter()
    
    private let weatherButton = UIButton()
    
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .systemGray6
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateDays()
        setupViews()
        addConstraints()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupViews() {
        view.addSubview(daysLabel)
        view.addSubview(dateLabel)
        view.addSubview(weatherButton)
        
        view.subviews.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            view.sizeToFit()
        }
                
        daysLabel.font = UIFont.systemFont(ofSize: 20)
        daysLabel.textColor = .darkGray
        daysLabel.text = "\(daysCount) days"
        dateLabel.text = dateFormatter.string(from: currentDate)
        print(dateLabel.text)
        //weatherLabel.text = "temp: \(self.temperature)"
        
        weatherButton.backgroundColor = .gray
        weatherButton.layer.cornerRadius = 24
        weatherButton.setImage(.fontAwesomeIcon(name: .cloudSun, style: .solid, textColor: .white, size: CGSize(width: 37, height: 37)), for: .normal)
        weatherButton.addTarget(self, action: #selector(showWeather), for: .touchUpInside)
        
    }
    
    private func addConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            daysLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            daysLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: daysLabel.bottomAnchor, constant: 10),
            dateLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            weatherButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 32),
            weatherButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -50),
            weatherButton.widthAnchor.constraint(equalToConstant: 52),
            weatherButton.heightAnchor.constraint(equalToConstant: 52)
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
    
    @objc func showWeather() {
        let viewController = weatherViewController()
        present(viewController, animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
