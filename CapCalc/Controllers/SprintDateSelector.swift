//
//  SprintDateSelector.swift
//  CapCalc
//
//  Created by William Calkins on 7/9/17.
//  Copyright © 2017 Calkins Computer Consulting. All rights reserved.
//

import UIKit
import EventKit

class SprintDateSelector: UIViewController {
    
    var selectedCalendar : EKCalendar?
    
    @IBOutlet weak var startDate: UIButton!
    @IBOutlet weak var endDate: UIButton!
    @IBOutlet weak var dateSelector: UIDatePicker!
    
    var selectedFromStart = false
    private var selectedStartDate : Date?
    private var selectedEndDate : Date?
    private var totalMeetingHours : Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //get changes from the date picker
        self.dateSelector.addTarget(self, action: #selector(SprintDateSelector.displayDateSelected(sender:)), for: .valueChanged)
        
        //set the min and max dates for the date picker
        if let datePicker = self.dateSelector {
            //Assume two week sprints
            datePicker.minimumDate = Date().addDays(numberOfDate: -1)
            datePicker.maximumDate = Date().addDays(numberOfDate: 14)
            
            self.selectedStartDate = datePicker.minimumDate
            self.selectedEndDate = datePicker.maximumDate
            
            if let displayStartDate = self.selectedStartDate?.shortDateForDisplay() {
                self.startDate.setTitle(displayStartDate, for: .normal)
            }
            
            if let displayEndDate = self.selectedEndDate?.shortDateForDisplay() {
                self.endDate.setTitle(displayEndDate, for: .normal)
            }

        }

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startDateSelected(_ sender: UIButton) {
        self.selectedFromStart = true
        if self.dateSelector.isHidden {
            self.dateSelector.isHidden = false
        }
        
        if let startDate = self.selectedStartDate {
            self.dateSelector.setDate(startDate, animated: true)
        }
    }
    
    @IBAction func endDateSelected(_ sender: UIButton) {
        self.selectedFromStart = false
        if self.dateSelector.isHidden {
            self.dateSelector.isHidden = false
        }
        
        if let endDate = self.selectedEndDate {
            self.dateSelector.setDate(endDate, animated: true)
        }
    }
    
    @objc func displayDateSelected(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        if self.selectedFromStart {
            //update the start date button
            self.startDate.setTitle(dateFormatter.string(from: sender.date), for: .normal)
            self.selectedStartDate = sender.date
        } else {
            //update the end date button
            self.endDate.setTitle(dateFormatter.string(from: sender.date), for: .normal)
            self.selectedEndDate = sender.date
        }
        
    }
    
    @IBAction func calculateCapacity(_ sender: UIButton) {
        
        guard let givenCalendar = self.selectedCalendar else {
            return
        }
        
        if let givenStartDate = self.selectedStartDate, let givenEndDate = self.selectedEndDate {
            self.totalMeetingHours = 0 //reset the meeting hours
            let eventPredicate = EKEventStore().predicateForEvents(withStart: givenStartDate, end: givenEndDate, calendars: [givenCalendar])
            let workEvents = EKEventStore().events(matching: eventPredicate)
            for event in workEvents {
                let meetingHours = event.endDate.hours(fromDate: event.startDate)
                if meetingHours > 0 {
                    self.totalMeetingHours += meetingHours
                }
            }
            
            if self.totalMeetingHours > 0 {
                self.performSegue(withIdentifier: "calcCapSegue", sender: self)
            }
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "calcCapSegue" {
            if let capResultsController = segue.destination as? CapacityResultsController {
                capResultsController.meetingHours = self.totalMeetingHours
                if let givenStartDate = self.selectedStartDate, let givenEndDate = self.selectedEndDate {
                    capResultsController.eventDateRange = (givenStartDate, givenEndDate)
                }
                capResultsController.selectedCalendar = self.selectedCalendar
            }
            
        }
    }

}

extension Date {
    func addDays(numberOfDate: Int) -> Date? {
        return Calendar.current.date(byAdding: .day, value: numberOfDate, to: self)
    }
    
    func subtractDays(numberOfDays: Int) -> Date? {
        return Calendar.current.date(byAdding: .day, value: numberOfDays, to: self)
    }
    
    func hours(fromDate: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: fromDate, to: self).hour ?? 0
    }
    
    func minutes(fromDate: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: fromDate, to: self).minute ?? 0
    }
    
    func shortDateForDisplay() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        return dateFormatter.string(from: self)
    }
    
    
}
