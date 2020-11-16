//
//  FinishButtonTableViewCell.swift
//  PodiFit
//
//  Created by Griffin on 12/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit


class FinishButtonTableViewCell: UITableViewCell {

    static let identifier = "FinishButtonTableViewCell"
    
    var delegate: UnwindDelegator!
    
    static func nib() -> UINib{
        return UINib(nibName: "FinishButtonTableViewCell", bundle: nil)
    }
    
    @IBAction func btnDone(_ sender: Any) {
        if newSelectedExercise.count >= 5{
            if (self.delegate != nil) {
                self.delegate.unwindSegueFromCell()
            }
        }
        else{
            if (self.delegate != nil) {
                self.delegate.showAlert()
            }
        }
        print("pencet done buat unwind")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
