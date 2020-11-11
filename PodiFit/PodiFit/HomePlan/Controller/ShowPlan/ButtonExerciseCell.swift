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
    
    var colView = UITableViewController()
    var delegate: CollectionViewCellDelegator!

    @IBOutlet weak var btnExercise: UIButton!
    
    @IBAction func tapExerciseBtn(_ sender: Any) {
        if (self.delegate != nil) {
            self.delegate.callSegueFromColViewCell()
            print("inside clicked")
        }
        
        print("Button exercise clicked")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        btnExercise.layer.borderWidth = 2
        btnExercise.layer.cornerRadius = 37.5
        btnExercise.layer.borderColor = #colorLiteral(red: 0.9130336642, green: 0.9586860538, blue: 0.3836800456, alpha: 1)
    }
}
