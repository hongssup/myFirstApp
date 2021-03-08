//
//  AddScheduleViewController.swift
//  myFirstApp
//
//  Created by SeoYeon on 2021/03/08.
//

import Foundation
import UIKit
import MaterialComponents

class AddScheduleViewController: UIViewController {
    
//    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
//    override var prefersStatusBarHidden: Bool { return false }
    let titleView = UIView()
    let dismissButton = UIButton()
    let saveButton = UIButton()
    let titleLable = UILabel()
    
    var inputText = UITextField()
    var inputMemo = UITextField()
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white
        self.view = view
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "추가"
        setupViews()
        addConstraints()
    }
    
    private func setupViews() {
        view.addSubview(titleView)
        view.addSubview(dismissButton)
        view.addSubview(saveButton)
        view.addSubview(titleLable)
        view.addSubview(inputText)
        view.addSubview(inputMemo)
        view.subviews.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            view.sizeToFit()
        }
        
        titleView.backgroundColor = MDCPalette.deepOrange.tint300
        
        dismissButton.backgroundColor = .clear
        dismissButton.setTitle("취소", for: .normal)
        dismissButton.setTitleColor(UIColor.white, for: .normal)
        dismissButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        dismissButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        
        saveButton.backgroundColor = .clear
        saveButton.setTitle("저장", for: .normal)
        saveButton.setTitleColor(UIColor.white, for: .normal)
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        saveButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        
        titleLable.text = "일정 추가"
        titleLable.font = UIFont.boldSystemFont(ofSize: 18)
        titleLable.textColor = .white
        
        inputText.font = UIFont.systemFont(ofSize: 16)
        //inputText.borderStyle = UITextField.BorderStyle.roundedRect
        inputText.autocapitalizationType = .none
        inputText.backgroundColor = .lightGray
    }
    
    private func addConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: view.topAnchor),
            titleView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            titleView.bottomAnchor.constraint(equalTo: safeArea.topAnchor, constant: 44),
            
            dismissButton.topAnchor.constraint(equalTo: safeArea.topAnchor),
            dismissButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            dismissButton.widthAnchor.constraint(equalToConstant: 64),
            dismissButton.bottomAnchor.constraint(equalTo: titleView.bottomAnchor),
            
            saveButton.topAnchor.constraint(equalTo: safeArea.topAnchor),
            saveButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 64),
            saveButton.bottomAnchor.constraint(equalTo: titleView.bottomAnchor),
            
            titleLable.topAnchor.constraint(equalTo: safeArea.topAnchor),
            titleLable.bottomAnchor.constraint(equalTo: titleView.bottomAnchor),
            titleLable.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            inputText.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 80),
            inputText.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            inputText.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            inputText.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    @objc func cancel(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
