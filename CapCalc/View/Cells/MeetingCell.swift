//
//  MeetingCell.swift
//  CapCalc
//
//  Created by William Calkins on 7/14/17.
//  Copyright © 2017 Calkins Computer Consulting. All rights reserved.
//

import UIKit

class MeetingCell: UITableViewCell {
    
    @IBOutlet weak var meetingTitle: UILabel!
    @IBOutlet weak var organizer: UILabel!
    @IBOutlet weak var totalHours: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        self.meetingTitle.text = nil
        self.organizer.text = nil
        self.totalHours.text = nil
    }
    
    

}
