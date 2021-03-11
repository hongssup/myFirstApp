//
//  ListCell.swift
//  myFirstApp
//
//  Created by SeoYeon on 2021/03/03.
//

import Foundation
import UIKit
import MaterialComponents.MDCCardCollectionCell

class ListCell: UICollectionViewCell {//MDCCardCollectionCell {
    let listLabel = UILabel()
    let listIcon = UILabel()
    let circle = UIView()
    let countLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.listLabel.font = UIFont.systemFont(ofSize: 16)
        self.listIcon.font = .fontAwesome(ofSize: 16, style: .solid)
        self.circle.layer.cornerRadius = 16
        self.circle.sizeToFit()
        self.countLabel.font = UIFont.systemFont(ofSize: 12)
        self.countLabel.textColor = .gray
        
        setupSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        backgroundColor = UIColor(red: 250, green: 250, blue: 250, alpha: 1)
        //layoutMargins.bottom = 5
        
        //layer.cornerRadius = 0
        layer.borderColor = UIColor.systemGray6.cgColor
        //layer.borderColor = UIColor.clear.cgColor
        layer.borderWidth = 0.2
//        cornerRadius = 0
//        setShadowElevation(ShadowElevation(0), for: .normal)
//        setBorderWidth(0.3, for: .normal)
//        setBorderColor(.systemGray6, for: .normal)
        
        
        addSubview(listLabel)
        addSubview(circle)
        addSubview(listIcon)
        addSubview(countLabel)

        subviews.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    func addConstraints() {
        NSLayoutConstraint.activate([
            circle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            circle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            circle.widthAnchor.constraint(equalToConstant: 32),
            circle.heightAnchor.constraint(equalToConstant: 32),
            
            listIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            listIcon.centerXAnchor.constraint(equalTo: circle.centerXAnchor),
            
            listLabel.topAnchor.constraint(equalTo: circle.topAnchor, constant: -2),
            listLabel.leadingAnchor.constraint(equalTo: listIcon.trailingAnchor, constant: 24),
            
            countLabel.leadingAnchor.constraint(equalTo: listLabel.leadingAnchor),
            countLabel.bottomAnchor.constraint(equalTo: circle.bottomAnchor, constant: 4)
            
        ])
    }
}
