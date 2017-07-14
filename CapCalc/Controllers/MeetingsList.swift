//
//  MeetingsList.swift
//  CapCalc
//
//  Created by William Calkins on 7/14/17.
//  Copyright © 2017 Calkins Computer Consulting. All rights reserved.
//

import UIKit
import EventKit

class MeetingsList: UITableViewController {
    
    var selectedCalendar : EKCalendar?
    var eventDateRange : eventDateRange?
    var events : [EKEvent]?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.gatherEventsForDateRange()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let givenEvents = self.events {
            return givenEvents.count
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let meetingCell = tableView.dequeueReusableCell(withIdentifier: "meetingCell", for: indexPath)

        // Configure the cell...
        
        if let givenEvents = self.events, let meetingCell = meetingCell as? MeetingCell {
            let givenEvent = givenEvents[indexPath.row]
            
            meetingCell.meetingTitle.text = givenEvent.title //set title
            
            if let givenOrganizer = givenEvent.organizer { //set organizer
                meetingCell.organizer.text = givenOrganizer.name
            }
            
            meetingCell.totalHours.text = "\(givenEvent.endDate.hours(fromDate: givenEvent.startDate)) Hours"
            
        }

        return meetingCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }


    //MARK: - Helper Functions
    private func gatherEventsForDateRange() {
        if let givenCalendar = self.selectedCalendar,
            let givenDateRange = self.eventDateRange {
            
            let eventPredicate = EKEventStore().predicateForEvents(withStart: givenDateRange.startDate, end: givenDateRange.endDate, calendars: [givenCalendar])
            self.events = EKEventStore().events(matching: eventPredicate)
            self.reloadData()
        }
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
