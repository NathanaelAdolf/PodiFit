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
    
    var difficulty = String()
    var tempNewArray = [Int]()
    
    
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
    
    func parseData(data: PlansModel) {
        
        if tempNewArray.isEmpty {
            durationInfo.text = "\((data.chosenExercise!.count) * 30) secs"
            exerciseInfo.text = "\(data.chosenExercise!.count) exercises"
        }
        else{
            durationInfo.text = "\((tempNewArray.count) * 30) secs"
            exerciseInfo.text = "\(tempNewArray.count) exercises"
        }
        
        
        print("id plan \(data.idPlan), id diff \(data.idDifficulty)")
        
        difficulty = difficultyHelper.checkDifficultyNameById(idDifficulty: Int(data.idDifficulty))
        levelInfo.text = difficulty
        
    }
}
