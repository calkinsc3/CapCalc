//
//  ActvitiyCell.swift
//  CapCalc
//
//  Created by William Calkins on 10/18/17.
//  Copyright © 2017 Calkins Computer Consulting. All rights reserved.
//

import UIKit

class ActvitiyCell: UITableViewCell {
    
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var activityDescr: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.dateView.layer.borderColor = UIColor.black.cgColor
        self.dateView.layer.borderWidth = 1
        self.dateView.layer.masksToBounds = true
        let dateViewHeight = self.dateView.layer.visibleRect.height
        self.dateView.layer.cornerRadius = dateViewHeight/2.0
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
