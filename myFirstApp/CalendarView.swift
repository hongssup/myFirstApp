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

class CalendarView: UIViewController, FSCalendarDataSource, FSCalendarDelegate {
    
    fileprivate weak var calendar: FSCalendar!
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .systemGray6
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
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.appearance.headerTitleColor = MDCPalette.deepOrange.tint500
        calendar.appearance.todayColor = .none
        calendar.appearance.titleTodayColor = MDCPalette.deepOrange.tint500
        calendar.appearance.weekdayTextColor = .darkGray
        calendar.appearance.titleWeekendColor = MDCPalette.deepOrange.tint800
    }
    
    private func addConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            calendar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            calendar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10),
            calendar.heightAnchor.constraint(equalToConstant: 400)        
        ])
    }
}
