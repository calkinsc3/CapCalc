//
//  CapacityResultsController.swift
//  CapCalc
//
//  Created by William Calkins on 7/9/17.
//  Copyright © 2017 Calkins Computer Consulting. All rights reserved.
//

import UIKit

class CapacityResultsController: UITableViewController {

    @IBOutlet weak var totalCapcityDisplay: UILabel!
    @IBOutlet weak var meetingHoursDisplay: UILabel!
    @IBOutlet weak var totalCodingHoursDisplay: UILabel!
    
    var meetingHours = 0
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.totalCapacity = 85
        
        self.meetingHoursDisplay.text = "\(self.meetingHours) Hours"
        self.totalCodingHours = self.totalCapacity - self.meetingHours
        
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
        return 3
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
