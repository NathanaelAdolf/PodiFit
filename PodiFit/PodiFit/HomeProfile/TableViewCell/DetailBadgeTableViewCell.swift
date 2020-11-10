//
//  DetailBadgeTableViewCell.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 01/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class DetailBadgeTableViewCell: UITableViewCell {

    @IBOutlet var badgeImage: UIImageView!
    @IBOutlet var badgeTitle: UILabel!
    @IBOutlet var badgeDescription: UILabel!
    
    @IBOutlet var detailBadgeProgressView: UIProgressView!
    
    @IBOutlet var indicatorLabelProgress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        detailBadgeProgressView.progress = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
