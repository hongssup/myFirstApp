//
//  CalendarView.swift
//  myFirstApp
//
//  Created by SeoYeon on 2021/01/22.
//

import UIKit
import Foundation
import FSCalendar

class CalendarView: UIViewController, FSCalendarDataSource, FSCalendarDelegate {
    
    fileprivate weak var calendar: FSCalendar!
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .systemGray6
        self.view = view
        
        let calendar = FSCalendar(frame: CGRect(x: 20, y: 30, width: 320, height: 300))
        calendar.dataSource = self
        calendar.delegate = self
        view.addSubview(calendar)
        self.calendar = calendar
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
