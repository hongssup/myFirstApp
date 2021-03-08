//
//  AddListViewController.swift
//  myFirstApp
//
//  Created by SeoYeon on 2021/03/01.
//

import Foundation
import UIKit

class AddListViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    override var prefersStatusBarHidden: Bool { return false }
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
        view.addSubview(dismissButton)
        view.addSubview(saveButton)
        view.addSubview(titleLable)
        view.addSubview(inputText)
        view.addSubview(inputMemo)
        view.subviews.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            view.sizeToFit()
        }
        
        dismissButton.backgroundColor = .clear
        dismissButton.setTitle("취소", for: .normal)
        dismissButton.setTitleColor(UIColor.darkGray, for: .normal)
        dismissButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        dismissButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        
        saveButton.backgroundColor = .clear
        saveButton.setTitle("저장", for: .normal)
        saveButton.setTitleColor(UIColor.darkGray, for: .normal)
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        saveButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        
        titleLable.text = "항목 추가"
        titleLable.font = UIFont.systemFont(ofSize: 20)
        
        inputText.font = UIFont.systemFont(ofSize: 16)
        //inputText.borderStyle = UITextField.BorderStyle.roundedRect
        inputText.autocapitalizationType = .none
        inputText.backgroundColor = .lightGray
    }
    
    private func addConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 12),
            dismissButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 8),
            dismissButton.widthAnchor.constraint(equalToConstant: 64),
            dismissButton.heightAnchor.constraint(equalToConstant: 40),
            
            saveButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 12),
            saveButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -8),
            saveButton.widthAnchor.constraint(equalToConstant: 64),
            saveButton.heightAnchor.constraint(equalToConstant: 40),
            
            titleLable.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 12),
            titleLable.heightAnchor.constraint(equalToConstant: 40),
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
