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

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    fileprivate func findWorkCalendar() {
        
        guard let givenCalendar = self.selectedCalendar else {
            return
        }
        
//        var workEvents: [EKEvent]?
//        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        
//        //create start and end dates
//        if let startDate = dateFormatter.date(from: "2017-07-05"),
//            let endDate = dateFormatter.date(from: "2017-07-12"),
//            let workCalendar = eventStore.calendar(withIdentifier: "Work") {
//            
//            let eventPredicate = eventStore.predicateForEvents(withStart: startDate, end: endDate, calendars: [workCalendar])
//            
//            workEvents = eventStore.events(matching: eventPredicate)
//            if let returnedEvents = workEvents {
//                print("workEvent count = \(returnedEvents.count)")
//            }
//        }
        
        
    }
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
