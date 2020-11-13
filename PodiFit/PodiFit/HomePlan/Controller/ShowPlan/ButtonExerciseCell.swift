//
//  ButtonExerciseCell.swift
//  PodiFit
//
//  Created by Hafizul Ihsan Fadli on 09/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class ButtonExerciseCell: UICollectionViewCell {
    
    static let identifier = "ButtonExerciseCell"
    static func nib() -> UINib {
        return UINib(nibName: "ButtonExerciseCell", bundle: nil)
    }
    
    var delegate: ShowPlanDelegator!

    @IBOutlet weak var btnExercise: UIButton!
    @IBOutlet weak var numberDayLabel: UILabel!
    
    @IBAction func tapExerciseBtn(_ sender: Any) {
        if (self.delegate != nil) {
            self.delegate.callSegueFromColViewCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        btnExercise.layer.borderWidth = 2
        btnExercise.layer.cornerRadius = 37.5
        btnExercise.layer.borderColor = #colorLiteral(red: 0.7490196078, green: 0.8235294118, blue: 0.1333333333, alpha: 1)
    }
}
