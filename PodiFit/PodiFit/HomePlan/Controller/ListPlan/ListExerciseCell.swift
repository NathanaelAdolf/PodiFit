//
//  ListExerciseCell.swift
//  PodiFit
//
//  Created by Hafizul Ihsan Fadli on 09/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class ListExerciseCell: UITableViewCell {

    @IBOutlet weak var exerciseImage: UIImageView!
    @IBOutlet weak var exerciseNameLabel: UILabel!
    @IBOutlet weak var exerciseTimeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func parseData(data: ExerciseModel) {
        exerciseNameLabel.text = data.namaExercise
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
