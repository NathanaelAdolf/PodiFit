//
//  StackedTableViewCell.swift
//  PodiFit
//
//  Created by Griffin on 24/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class StackedTableViewCell: UITableViewCell {

    static let identifier = "StackedTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "StackedTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var levelImage: UIImageView!
    @IBOutlet weak var levelDesc: UILabel!
    @IBOutlet weak var levelType: UILabel!
    
    @IBOutlet weak var durationImage: UIImageView!
    @IBOutlet weak var durationDesc: UILabel!
    @IBOutlet weak var durationType: UILabel!
    
    
    @IBOutlet weak var exerciseImage: UIImageView!
    @IBOutlet weak var exerciseDesc: UILabel!
    @IBOutlet weak var exerciseType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        levelImage.image = UIImage(named: "2")
        levelDesc.text = "Level"
        levelType.text = "Easy"
        
        durationImage.image = UIImage(named: "2")
        durationDesc.text = "Duration"
        durationType.text = "10 min"
        
        exerciseImage.image = UIImage(named: "2")
        exerciseDesc.text = "Exercises"
        exerciseType.text = "5 moves"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
