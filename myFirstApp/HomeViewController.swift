//
//  HomeViewController.swift
//  myFirstApp
//
//  Created by SeoYeon on 2021/01/26.
//

import Foundation
import UIKit

class HomeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UIAdaptivePresentationControllerDelegate {
    
    let daysLabel = UILabel()
    let dateLabel = UILabel()
    var daysCount:Int = 0
    let calendar = Calendar.current
    let currentDate = Date()
    let dateFormatter = DateFormatter()
    
    private let weatherButton = UIButton()
    private let annivButton = UIButton()
    private let ccButton = UIButton()
    private let photoButton = UIButton()
    
    lazy var pickerView = UIPickerView()
    lazy var pickerData: [Int] = []
    var pickerNum: String = ""
    
    var imageView = UIImageView()
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .darkGray
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView = UIPickerView(frame: CGRect(x: 10, y: 50, width: 250, height: 150))
        pickerView.delegate = self
        pickerView.dataSource = self
        //imagePicker.delegate = self
        let minNum = 0
        let maxNum = 30
        pickerData = Array(stride(from: minNum, to: maxNum + 1, by: 1))
        
        calculateDays()
        setupViews()
        addConstraints()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    private func setupViews() {
        
                
        daysLabel.font = UIFont.systemFont(ofSize: 24)
        daysLabel.textColor = .white
        daysLabel.text = "\(daysCount) days"
        dateLabel.text = dateFormatter.string(from: currentDate)
        dateLabel.textColor = .white
        print(dateLabel.text)
        //weatherLabel.text = "temp: \(self.temperature)"
        
        //weatherButton.backgroundColor = .gray
        weatherButton.layer.borderWidth = 1
        weatherButton.layer.borderColor = UIColor.white.cgColor
        weatherButton.layer.cornerRadius = 18
        weatherButton.setImage(.fontAwesomeIcon(name: .cloudSun, style: .solid, textColor: .white, size: CGSize(width: 25, height: 25)), for: .normal)
        weatherButton.addTarget(self, action: #selector(showWeather), for: .touchUpInside)
        
        //annivButton.backgroundColor = .gray
        annivButton.layer.borderWidth = 1
        annivButton.layer.borderColor = UIColor.white.cgColor
        annivButton.layer.cornerRadius = 18
        annivButton.setImage(.fontAwesomeIcon(name: .heart, style: .solid, textColor: .white, size: CGSize(width: 24, height: 24)), for: .normal)
        annivButton.addTarget(self, action: #selector(showAnniversary), for: .touchUpInside)
        
        //ccButton.backgroundColor = .gray
        ccButton.layer.borderWidth = 1
        ccButton.layer.borderColor = UIColor.white.cgColor
        ccButton.layer.cornerRadius = 18
        ccButton.setTitle(pickerNum, for: .normal)
        ccButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        //photoButton.backgroundColor = .gray
        photoButton.layer.borderWidth = 1
        photoButton.layer.borderColor = UIColor.white.cgColor
        photoButton.layer.cornerRadius = 18
        photoButton.setImage(.fontAwesomeIcon(name: .images, style: .solid, textColor: .white, size: CGSize(width: 24, height: 24)), for: .normal)
        photoButton.addTarget(self, action: #selector(uploadPhoto), for: .touchUpInside)
        
        view.addSubview(imageView)
        view.addSubview(daysLabel)
        view.addSubview(dateLabel)
        view.addSubview(weatherButton)
        view.addSubview(annivButton)
        view.addSubview(ccButton)
        view.addSubview(photoButton)
        
        view.subviews.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            view.sizeToFit()
        }
    }
    
    private func addConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            daysLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 96),
            daysLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: daysLabel.bottomAnchor, constant: 4),
            dateLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            weatherButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            weatherButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            weatherButton.widthAnchor.constraint(equalToConstant: 36),
            weatherButton.heightAnchor.constraint(equalToConstant: 36),
            
            annivButton.trailingAnchor.constraint(equalTo: weatherButton.leadingAnchor, constant: -14),
            annivButton.topAnchor.constraint(equalTo: weatherButton.topAnchor),
            annivButton.widthAnchor.constraint(equalTo: weatherButton.widthAnchor),
            annivButton.heightAnchor.constraint(equalTo: weatherButton.heightAnchor),

            ccButton.trailingAnchor.constraint(equalTo: annivButton.leadingAnchor, constant: -14),
            ccButton.topAnchor.constraint(equalTo: weatherButton.topAnchor),
            ccButton.widthAnchor.constraint(equalTo: weatherButton.widthAnchor),
            ccButton.heightAnchor.constraint(equalTo: weatherButton.heightAnchor),
            
            photoButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            photoButton.topAnchor.constraint(equalTo: weatherButton.topAnchor),
            photoButton.widthAnchor.constraint(equalTo: weatherButton.widthAnchor),
            photoButton.heightAnchor.constraint(equalTo: weatherButton.heightAnchor),

            imageView.heightAnchor.constraint(equalTo: view.heightAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
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
        //viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .overCurrentContext
        //viewController.presentationController?.delegate = self
        present(viewController, animated: true, completion: nil)
    }
    
    @objc func showAnniversary() {
        let viewController2 = anniversaryViewController()
        //viewController2.modalPresentationStyle = .fullScreen
        present(viewController2, animated: true, completion: nil)
    }
    
    @objc func showAlert() {
        let ac = UIAlertController(title: "잔여갯수", message: "\n\n\n\n\n\n\n\n\n\n", preferredStyle: .alert)
        //ac.isModalInPresentation = true
        ac.view.addSubview(pickerView)
        ac.addAction(UIAlertAction(title: "완료", style: .default, handler: { _ in
            let pickerValue = self.pickerData[self.pickerView.selectedRow(inComponent: 0)]
            print("Picker value: \(pickerValue) was selected")
        }))
        ac.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        present(ac, animated: true)
        
    }
    
    @objc func uploadPhoto() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        //imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickerNum = "\(pickerData[row])"
        ccButton.setTitle(pickerNum, for: .normal)
        return pickerNum
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        self.navigationController?.setNavigationBarHidden(false, animated: false)
//    }
}

// MARK: - UIIMagePickerControllerDelegate Methods

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
        }
            
        dismiss(animated: true, completion: nil)
    }
        
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
