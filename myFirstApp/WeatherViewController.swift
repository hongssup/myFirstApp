//
//  WeatherViewController.swift
//  myFirstApp
//
//  Created by SeoYeon on 2021/03/03.
//

import Foundation
import UIKit

class weatherViewController: UIViewController {
    
    private var currentWeather: Current?
    var temperature: Double = 0.0
    var icon: String = ""
    let weatherLabel = UILabel()
    let weatherImage = UIImageView()
    
    override func loadView() {
        //let view = UIView(frame: CGRect(x: self.view.bounds.width, y: self.view.bounds.height/2, width: self.view.bounds.width, height: self.view.bounds.height/2))
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white
        self.view = view
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchWeather()
        setupViews()
        addConstraints()
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
        view.addSubview(weatherLabel)
        view.addSubview(weatherImage)
        view.subviews.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            view.sizeToFit()
        }
    }
    
    private func addConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            weatherLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -50),
            weatherLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            
            weatherImage.bottomAnchor.constraint(equalTo: weatherLabel.topAnchor, constant: -8),
            weatherImage.leadingAnchor.constraint(equalTo: weatherLabel.leadingAnchor)
        ])
    }
}
