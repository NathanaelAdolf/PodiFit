//
//  StackedTableViewCell.swift
//  PodiFit
//
//  Created by Griffin on 24/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class ExerciseHeaderTableViewCell: UITableViewCell {

    static let identifier = "ExerciseHeaderTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "ExerciseHeaderTableViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
