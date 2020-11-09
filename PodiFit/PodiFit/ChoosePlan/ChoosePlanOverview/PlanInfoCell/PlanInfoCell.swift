//
//  PlanInfoCell.swift
//  PodiFit
//
//  Created by Griffin on 09/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class PlanInfoCell: UITableViewCell {

    static let identifier = "PlanInfoCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "PlanInfoCell", bundle: nil)
    }
    
    @IBOutlet weak var levelInfo: UILabel!
    
    @IBOutlet weak var durationInfo: UILabel!
    
    @IBOutlet weak var exerciseInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
