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
    let dismissButton = UIButton()
    
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
        modalView.layer.cornerRadius = 20
        
        weatherLabel.textColor = .darkGray

        dismissButton.setTitle("×", for: .normal)
        dismissButton.setTitleColor(UIColor.darkGray, for: .normal)
        dismissButton.titleLabel?.font = UIFont.systemFont(ofSize: 32)
        dismissButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        view.addSubview(modalView)
        view.addSubview(weatherLabel)
        view.addSubview(weatherImage)
        view.addSubview(dismissButton)
        
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
            weatherLabel.centerXAnchor.constraint(equalTo: modalView.centerXAnchor),
            
            dismissButton.topAnchor.constraint(equalTo: modalView.topAnchor, constant: 8),
            dismissButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -8),
            dismissButton.widthAnchor.constraint(equalToConstant: 44),
            dismissButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    @objc func cancel(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}

//extension weatherViewController: UIAdaptivePresentationControllerDelegate {
//    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
//        self.dismiss(animated: true, completion: nil)
//    }
//}
