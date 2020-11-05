//
//  NoDataTableViewCell.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 04/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class NoDataTableViewCell: UITableViewCell {
    
    @IBOutlet var emptyMessageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       // self.backgroundColor = Colors.yellowColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
