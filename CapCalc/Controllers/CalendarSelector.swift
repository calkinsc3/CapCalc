//
//  CalendarSelector.swift
//  CapCalc
//
//  Created by William Calkins on 7/10/17.
//  Copyright © 2017 Calkins Computer Consulting. All rights reserved.
//

import UIKit
import EventKit


class CalendarSelector: UITableViewController {
    
    var eventStore: EKEventStore?
    var isAcessToEventStoreGranted = false
    
    var calendars: [EKCalendar]?


    override func viewDidLoad() {
        super.viewDidLoad()

        //get permission to use the event store for the calendar data
        self.eventStore = EKEventStore()
        self.updateAuthorizationStatusToAccessEventStore()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - TableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let calendars = self.calendars {
            return calendars.count
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CalendarCell", for: indexPath)
        
        if let calendars = self.calendars {
            cell.textLabel?.text = calendars[indexPath.row].title
        } else {
            cell.textLabel?.text = "Unknown Calendar"
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    //MARK:- Helper Functions
    fileprivate func updateAuthorizationStatusToAccessEventStore() {
        
        let authorizationStatus = EKEventStore.authorizationStatus(for: .event)
        
        switch authorizationStatus {
            
        case .notDetermined:
            //First time running the app
            self.requestAccessToCalendars()
        case .authorized:
            //Load the calendars for selection
            self.loadCalendars()
            self.tableView.reloadData()
        case .restricted, .denied:
            //we need permission to the calendars
            self.requestAccessToCalendars()
            
        }
    }
    
    fileprivate func requestAccessToCalendars() {
        
        self.eventStore?.requestAccess(to: .event, completion: { (allowed, error) in
            if error == nil {
                self.isAcessToEventStoreGranted = allowed
                if allowed {
                    self.loadCalendars()
                    self.tableView.reloadData()
                } else {
                    print("Boo...We do not have permission")
                }
            }
        })
    }
    
    fileprivate func loadCalendars() {
        self.calendars = self.eventStore?.calendars(for: .event).sorted(by: {(cal1, cal2) -> Bool in
            return cal1.title < cal2.title
        })
        
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "dateSelectionSegue" {
            //get the selected calendar and pass it to the date selction
            if let selectedRowIndex = self.tableView.indexPathForSelectedRow,
                let calendars = self.calendars,
                let sprintDateSelectionController = segue.destination as? SprintDateSelector {
                //pass the selected calendar
                sprintDateSelectionController.selectedCalendar = calendars[selectedRowIndex.row]
                
            }
        }
        
        
    }

}
