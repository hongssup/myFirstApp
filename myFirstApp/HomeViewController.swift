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
    
    private var currentWeather: Current?
    
    var temperature: Double = 0.0
    var icon: String = ""
    let weatherLabel = UILabel()
    let weatherImage = UIImageView()
    
    

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
    
    
    override func viewWillLayoutSubviews() {
        fetchWeather()
    }
    
    func fetchWeather() {
        WeatherService().getWeather { result in
            switch result {
            case .success(let weatherResponse):
                DispatchQueue.main.async {
                    self.currentWeather = weatherResponse.current
                    self.temperature = self.currentWeather?.temp ?? 0.0
                    self.weatherLabel.text = "temp: \(self.temperature)"
                    self.weatherImage.image = UIImage(named: self.currentWeather?.weather[0].icon ?? "01d")
                }
            case .failure(_ ):
                print("error")
            }
        }
    }
    
    private func setupViews() {
        view.addSubview(daysLabel)
        view.addSubview(dateLabel)
        view.addSubview(weatherLabel)
        view.addSubview(weatherImage)
        
        view.subviews.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
                
        daysLabel.font = UIFont.systemFont(ofSize: 20)
        daysLabel.textColor = .darkGray
        daysLabel.text = "\(daysCount) days"
        dateLabel.text = dateFormatter.string(from: currentDate)
        print(dateLabel.text)
        //weatherLabel.text = "temp: \(self.temperature)"
    }
    
    private func addConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            daysLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            daysLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: daysLabel.bottomAnchor, constant: 10),
            dateLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            weatherLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -50),
            weatherLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            
            weatherImage.bottomAnchor.constraint(equalTo: weatherLabel.topAnchor, constant: -8),
            weatherImage.leadingAnchor.constraint(equalTo: weatherLabel.leadingAnchor)
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
