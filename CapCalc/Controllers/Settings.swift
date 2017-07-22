//
//  Settings.swift
//  CapCalc
//
//  Created by William Calkins on 7/22/17.
//  Copyright © 2017 Calkins Computer Consulting. All rights reserved.
//

import UIKit

class Settings: UITableViewController {

    
    @IBOutlet weak var scheduleDescr: UILabel!
    @IBOutlet weak var count54Day: UISwitch!
    @IBOutlet weak var countTentativeMeetings: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

    // MARK: - Navigation
    
    @IBAction func unwindToSetting(_ sender: UIStoryboardSegue) {
        
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "calendarSegue" {
            if let calendarController = segue.destination as? CalendarSelector {
                calendarController.unwindToSettings = true
            }
        }
    }

}
