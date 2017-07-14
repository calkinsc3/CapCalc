//
//  CapacityResultsController.swift
//  CapCalc
//
//  Created by William Calkins on 7/9/17.
//  Copyright © 2017 Calkins Computer Consulting. All rights reserved.
//

import UIKit
import EventKit

class CapacityResultsController: UITableViewController {

    @IBOutlet weak var totalCapcityDisplay: UILabel!
    @IBOutlet weak var meetingHoursDisplay: UILabel!
    @IBOutlet weak var totalCodingHoursDisplay: UILabel!
    @IBOutlet weak var codingHoursPerDay: UILabel!
    
    var selectedCalendar : EKCalendar?
    var eventDateRange : eventDateRange?
    
    var meetingHours = 0
    let hoursPerDay = 8 //TODO:- make this a setting
    
    var totalCapacity : Int = 0 {
        didSet {
            if let totalCap = self.totalCapcityDisplay {
                totalCap.text = "\(self.totalCapacity) Hours"
            }
        }
    }
    var totalCodingHours : Int = 0 {
        didSet {
            if let totalCodingHoursLabel = self.totalCodingHoursDisplay {
                totalCodingHoursLabel.text = "\(self.totalCodingHours) Hours"
            }
        }
    }
    var codingHourByDay: Int = 0 {
        didSet {
            if let codingPerDayLabel = self.codingHoursPerDay {
                codingPerDayLabel.text = "\(self.codingHourByDay) Hours"
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.totalCapacity = 85 //TODO:- make this a setting
        
        self.meetingHoursDisplay.text = "\(self.meetingHours) Hours"
        self.totalCodingHours = self.totalCapacity - self.meetingHours
        
        self.codingHourByDay = self.totalCodingHours / self.hoursPerDay
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showMeetingSegue" {
            if let showMeetingContoller = segue.destination as? MeetingsList {
                showMeetingContoller.selectedCalendar = self.selectedCalendar
                showMeetingContoller.eventDateRange = self.eventDateRange
            }
            
        }
        
    }
    

}
