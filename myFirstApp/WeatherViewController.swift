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
    let modalView = UIView()
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .clear
        self.view = view
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchWeather()
        setupViews()
        addConstraints()
        //self.isModalInPresentation = true
    }
    
    func fetchWeather() {
        WeatherService().getWeather { result in
            switch result {
            case .success(let weatherResponse):
                DispatchQueue.main.async {
                    self.currentWeather = weatherResponse.current
                    self.temperature = self.currentWeather?.temp ?? 0.0
                    self.weatherLabel.text = "\(self.temperature)˚c"
                    self.weatherImage.image = UIImage(named: self.currentWeather?.weather[0].icon ?? "01d")
                }
            case .failure(_ ):
                print("error")
            }
        }
    }
    
    private func setupViews() {
        
        modalView.backgroundColor = .white
        modalView.layer.cornerRadius = 16
        
        weatherLabel.textColor = .darkGray
        view.addSubview(modalView)
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
            modalView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            modalView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            modalView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, constant: -160),
            
            weatherImage.topAnchor.constraint(equalTo: modalView.topAnchor, constant: 48),
            weatherImage.centerXAnchor.constraint(equalTo: modalView.centerXAnchor),
            weatherImage.widthAnchor.constraint(equalToConstant: 68),
            weatherImage.heightAnchor.constraint(equalToConstant: 68),
            
            weatherLabel.topAnchor.constraint(equalTo: weatherImage.bottomAnchor),
            weatherLabel.centerXAnchor.constraint(equalTo: modalView.centerXAnchor)
        ])
    }
}

//extension weatherViewController: UIAdaptivePresentationControllerDelegate {
//    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
//        self.dismiss(animated: true, completion: nil)
//    }
//}
