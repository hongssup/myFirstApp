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
    var dismissButton = UIButton()
    var saveButton = UIButton()
    
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
        view.subviews.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            view.sizeToFit()
        }
        
        dismissButton.backgroundColor = .clear
        dismissButton.setTitle("×", for: .normal)
        dismissButton.setTitleColor(UIColor.darkGray, for: .normal)
        dismissButton.titleLabel?.font = UIFont.systemFont(ofSize: 32)
        dismissButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        
        saveButton.backgroundColor = .clear
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(UIColor.darkGray, for: .normal)
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        saveButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
    }
    
    private func addConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 12),
            dismissButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 12),
            dismissButton.widthAnchor.constraint(equalToConstant: 40),
            dismissButton.heightAnchor.constraint(equalToConstant: 40),
            
            saveButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 12),
            saveButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -12),
            saveButton.widthAnchor.constraint(equalToConstant: 72),
            saveButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func cancel(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
