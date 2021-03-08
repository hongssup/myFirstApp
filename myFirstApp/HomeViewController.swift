//
//  HomeViewController.swift
//  myFirstApp
//
//  Created by SeoYeon on 2021/01/26.
//

import Foundation
import UIKit

class HomeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
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
    
    //let imagePicker = UIImagePickerController()
    var imageView = UIImageView()
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .systemGray6
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
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        calculateDays()
        setupViews()
        addConstraints()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    private func setupViews() {
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
        
        annivButton.backgroundColor = .gray
        annivButton.layer.cornerRadius = 24
        annivButton.setImage(.fontAwesomeIcon(name: .heart, style: .solid, textColor: .white, size: CGSize(width: 36, height: 36)), for: .normal)
        annivButton.addTarget(self, action: #selector(showAnniversary), for: .touchUpInside)
        
        ccButton.backgroundColor = .gray
        ccButton.layer.cornerRadius = 24
        ccButton.setTitle(pickerNum, for: .normal)
        ccButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        photoButton.backgroundColor = .gray
        photoButton.layer.cornerRadius = 24
        photoButton.setImage(.fontAwesomeIcon(name: .images, style: .solid, textColor: .white, size: CGSize(width: 36, height: 36)), for: .normal)
        photoButton.addTarget(self, action: #selector(uploadPhoto), for: .touchUpInside)
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
            weatherButton.heightAnchor.constraint(equalToConstant: 52),
            
            annivButton.leadingAnchor.constraint(equalTo: weatherButton.trailingAnchor, constant: 16),
            annivButton.bottomAnchor.constraint(equalTo: weatherButton.bottomAnchor),
            annivButton.widthAnchor.constraint(equalTo: weatherButton.widthAnchor),
            annivButton.heightAnchor.constraint(equalTo: weatherButton.heightAnchor),
            
            ccButton.leadingAnchor.constraint(equalTo: annivButton.trailingAnchor, constant: 16),
            ccButton.bottomAnchor.constraint(equalTo: weatherButton.bottomAnchor),
            ccButton.widthAnchor.constraint(equalTo: weatherButton.widthAnchor),
            ccButton.heightAnchor.constraint(equalTo: weatherButton.heightAnchor),
            
            photoButton.leadingAnchor.constraint(equalTo: ccButton.trailingAnchor, constant: 16),
            photoButton.bottomAnchor.constraint(equalTo: weatherButton.bottomAnchor),
            photoButton.widthAnchor.constraint(equalTo: weatherButton.widthAnchor),
            photoButton.heightAnchor.constraint(equalTo: weatherButton.heightAnchor)
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
        //viewController.modalPresentationStyle = .popover
        present(viewController, animated: true, completion: nil)
    }
    
    @objc func showAnniversary() {
        let viewController2 = anniversaryViewController()
        viewController2.modalPresentationStyle = .fullScreen
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
        imagePicker.allowsEditing = true
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
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
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
