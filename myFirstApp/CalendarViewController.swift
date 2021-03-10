//
//  CalendarView.swift
//  myFirstApp
//
//  Created by SeoYeon on 2021/01/22.
//

import UIKit
import Foundation
import FSCalendar
import MaterialComponents

class CalendarViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {
    
    fileprivate weak var calendar: FSCalendar!
    
    let addScheduleButton = MDCFloatingButton()
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white
        self.view = view
        
        //let calendar = FSCalendar(frame: CGRect(x: 20, y: 30, width: 320, height: 400))
        let calendar = FSCalendar()
        calendar.dataSource = self
        calendar.delegate = self
        view.addSubview(calendar)
        self.calendar = calendar
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCalendar()
        addConstraints()
    }
    
    private func setupCalendar() {
        
        view.addSubview(addScheduleButton)
        calendar.translatesAutoresizingMaskIntoConstraints = false
        addScheduleButton.translatesAutoresizingMaskIntoConstraints = false
        calendar.appearance.headerTitleColor = MDCPalette.deepOrange.tint500
        calendar.appearance.todayColor = .none
        calendar.appearance.titleTodayColor = MDCPalette.deepOrange.tint500
        calendar.appearance.weekdayTextColor = .darkGray
        calendar.appearance.titleWeekendColor = MDCPalette.deepOrange.tint800
        calendar.appearance.selectionColor = .darkGray

        addScheduleButton.setImage(.fontAwesomeIcon(name: .plus, style: .solid, textColor: .white, size: CGSize(width: 24, height: 24)), for: .normal)
        addScheduleButton.backgroundColor = MDCPalette.deepOrange.tint300
        addScheduleButton.setElevation(ShadowElevation(1), for: .normal)
        addScheduleButton.addTarget(self, action: #selector(addSchedule), for: .touchUpInside)
    }
    
    private func addConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            calendar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            calendar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10),
            calendar.heightAnchor.constraint(equalToConstant: 400),
            
            addScheduleButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -28),
            addScheduleButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -28),
            addScheduleButton.heightAnchor.constraint(equalToConstant: 40),
            addScheduleButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func addSchedule() {
        let vc = AddScheduleViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)        
    }
}
