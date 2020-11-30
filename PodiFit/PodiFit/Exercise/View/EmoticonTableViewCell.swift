//
//  EmoticonTableViewCell.swift
//  PodiFit
//
//  Created by Muhamad Vicky on 11/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class EmoticonTableViewCell: UITableViewCell {

    @IBOutlet weak var tiredViewBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func tiredDidTap () {
//        tiredViewBtn.setImage(UIImage(systemName: "tired_face"),
//                          for: [.highlighted, .selected])
    }

}
