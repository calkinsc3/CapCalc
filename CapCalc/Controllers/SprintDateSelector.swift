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
    
    var eventStore: EKEventStore?
    var isAcessToEventStoreGranted = false

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
    
    func updateAuthorizationStatusToAccessEventStore() {
        
        let authorizationStatus = EKEventStore.authorizationStatus(for: .event)
        
        switch authorizationStatus {
        case .denied:
            print("send an alert")
        case .restricted :
            print("send an alert")
        case .authorized:
            print("proceed with caution")
        case .notDetermined:
            self.eventStore?.requestAccess(to: .event, completion: { (allowed, error) in
                if error == nil {
                    self.isAcessToEventStoreGranted = allowed
                    if allowed {
                        print("We have permission")
                    } else {
                        print("Boo...We do not have permission")
                    }
                }
            })
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
