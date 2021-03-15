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
    
    let titleView = UIView()
    let dismissButton = UIButton()
    let saveButton = UIButton()
    let titleLable = UILabel()
    
    let colorView = UIView()
    let circle = UIView()
    let bothButton = UIButton()
    let meButton = UIButton()
    let youButton = UIButton()
    
    let tableView = UITableView(frame: .zero, style: .plain)
    var inputText = UITextField()
    var inputMemo = UITextView()
    private var items = ["", "날짜", "", "시간", "위치"]
    var datePicker = UIDatePicker()
    var dateLabel = UILabel()
    let dateFormatter = DateFormatter()
    let timeLabel = UITextField()
    let placeLabel = UITextField()
    let memoLabel = UILabel()
    var itemsResult: [String] = []
    
    override func loadView() {
        super.loadView()
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .systemGray6
        self.view = view
        setupTableView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "추가"
        setupTitleView()
        setupColorView()
        view.subviews.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            view.sizeToFit()
        }
        addConstraints()
        
    }
    
    private func setupTitleView() {
        
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
        
        view.addSubview(titleView)
        view.addSubview(dismissButton)
        view.addSubview(saveButton)
        view.addSubview(titleLable)
        
    }
    
    private func setupColorView() {
        colorView.backgroundColor = .white
        circle.layer.cornerRadius = 8
        circle.backgroundColor = .gray
        bothButton.setTitle("공동", for: .normal)
        bothButton.setTitleColor(.gray, for: .normal)
        //bothButton.setTitleColor(.yellow, for: .selected)
        //bothButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        bothButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        meButton.setTitle("본인", for: .normal)
        meButton.setTitleColor(.gray, for: .normal)
        meButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        youButton.setTitle("상대방", for: .normal)
        youButton.setTitleColor(.gray, for: .normal)
        youButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        view.addSubview(colorView)
        view.addSubview(circle)
        view.addSubview(bothButton)
        view.addSubview(meButton)
        view.addSubview(youButton)
    }
    
    private func setupTableView() {
        inputText.font = UIFont.systemFont(ofSize: 16)
        inputText.placeholder = "내용을 입력하세요."
        //inputText.borderStyle = UITextField.BorderStyle.roundedRect
        inputText.autocapitalizationType = .none
        //inputText.backgroundColor = .lightGray
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //tableView.register(datePickerCell.self, forCellReuseIdentifier: "datePickerCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        datePicker.locale = Locale(identifier: "ko-KR")
        datePicker.isHidden = true
        datePicker.date = Date()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일 eeee"
        //dateFormatter.dateStyle = .short
        //dateFormatter.timeStyle = .short
        dateLabel.text = "\(dateFormatter.string(from: datePicker.date))"
        timeLabel.textAlignment = .right
        placeLabel.textAlignment = .right
        memoLabel.text = "메모"
        memoLabel.textColor = .darkGray
        inputMemo.font = UIFont.systemFont(ofSize: 16)
        //tableView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        
        view.addSubview(tableView)
        view.addSubview(inputText)
        view.addSubview(inputMemo)
        view.addSubview(dateLabel)
        view.addSubview(datePicker)
        view.addSubview(timeLabel)
        view.addSubview(placeLabel)
        view.addSubview(memoLabel)
        view.subviews.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
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
            
//            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            inputText.topAnchor.constraint(equalTo: tableView.topAnchor),
            inputText.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            inputText.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            inputText.heightAnchor.constraint(equalToConstant: 44),
            
            colorView.topAnchor.constraint(equalTo: titleView.bottomAnchor),
            colorView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            colorView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            colorView.heightAnchor.constraint(equalToConstant: 44),
            
            circle.centerYAnchor.constraint(equalTo: colorView.centerYAnchor),
            circle.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 28),
            circle.widthAnchor.constraint(equalToConstant: 16),
            circle.heightAnchor.constraint(equalToConstant: 16),
            
            bothButton.centerYAnchor.constraint(equalTo: colorView.centerYAnchor),
            bothButton.leadingAnchor.constraint(equalTo: circle.trailingAnchor, constant: 60),
            meButton.centerYAnchor.constraint(equalTo: colorView.centerYAnchor),
            meButton.leadingAnchor.constraint(equalTo: bothButton.trailingAnchor, constant: 52),
            youButton.centerYAnchor.constraint(equalTo: colorView.centerYAnchor),
            youButton.leadingAnchor.constraint(equalTo: meButton.trailingAnchor, constant: 52),
            
            timeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            timeLabel.widthAnchor.constraint(equalToConstant: 100),
            placeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            placeLabel.widthAnchor.constraint(equalToConstant: 100),
            
            memoLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            inputMemo.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 12),
            inputMemo.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16)
        ])
    }
    
    @objc func cancel(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

    @objc func changeColor(sender: UIButton) {
        if sender == bothButton {
            sender.setTitleColor(.yellow, for: .normal)
            meButton.setTitleColor(.gray, for: .normal)
            youButton.setTitleColor(.gray, for: .normal)
            circle.backgroundColor = .yellow
        } else if sender == meButton {
            sender.setTitleColor(.blue, for: .normal)
            bothButton.setTitleColor(.gray, for: .normal)
            youButton.setTitleColor(.gray, for: .normal)
            circle.backgroundColor = .blue
        } else {
            sender.setTitleColor(.red, for: .normal)
            bothButton.setTitleColor(.gray, for: .normal)
            meButton.setTitleColor(.gray, for: .normal)
            circle.backgroundColor = .red
        }
    }
    
    @objc func dateChanged(sender: UIDatePicker) {
        dateLabel.text = "\(dateFormatter.string(from: datePicker.date))"
    }
    
}

extension AddScheduleViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 12
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .systemGray6
            return footerView
        }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return items.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.textColor = .darkGray
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        if indexPath.section == 0 {
            cell.textLabel?.text = items[indexPath.row]
            
            switch indexPath.row {
            case 1:
                dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
                dateLabel.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
                cell.selectionStyle = UITableViewCell.SelectionStyle.default
                break
            case 2:
                //datePicker.widthAnchor.constraint(equalTo: cell.widthAnchor).isActive = true
                datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
                datePicker.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
                datePicker.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
                break
            case 3:
                timeLabel.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
                break
            case 4:
                placeLabel.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
                break
            default:
                
                break
            }
            
            //cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        } else {
            memoLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 12).isActive = true
            inputMemo.topAnchor.constraint(equalTo: cell.topAnchor, constant: 32).isActive = true
            inputMemo.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: -4).isActive = true
            //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            //cell.textLabel?.text = "메모"
            //cell.textLabel?.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
            //cell.textLabel?.textColor = .darkGray
            //cell.selectionStyle = UITableViewCell.SelectionStyle.none
            //inputMemo.text//numberOfLines = 0
            //inputMemo.sizeToFit()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dpIndexPath = NSIndexPath(row: 1, section: 0)
        if dpIndexPath as IndexPath == indexPath {
            datePicker.isHidden = !datePicker.isHidden
            
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.tableView.beginUpdates()
                
                self.tableView.deselectRow(at: indexPath, animated: true)
                self.dateChanged(sender: self.datePicker)
                self.tableView.endUpdates()
            })
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 2 {
                let height:CGFloat = datePicker.isHidden ? 0.0 : 216.0
                return height
            } else {
                return 44
            }
        } else {
            return 120
        }
    }
}
