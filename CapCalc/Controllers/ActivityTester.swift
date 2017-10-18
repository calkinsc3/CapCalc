//
//  ActivityTester.swift
//  CapCalc
//
//  Created by William Calkins on 10/18/17.
//  Copyright © 2017 Calkins Computer Consulting. All rights reserved.
//

import UIKit

class ActivityTester: UITableViewController {
    
    let activities = ["Open Claim", "Rental Activity", "Coversation Activity"]

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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.activities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "testActivity", for: indexPath)

        if let activityCell = cell as? ActvitiyCell {
            activityCell.activityDescr.text = self.activities[indexPath.row]
        }

        return cell
    }
    

}
