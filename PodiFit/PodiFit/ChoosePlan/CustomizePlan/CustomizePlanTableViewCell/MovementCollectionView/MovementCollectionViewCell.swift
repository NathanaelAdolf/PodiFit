//
//  MovementCollectionViewCell.swift
//  PodiFit
//
//  Created by Griffin on 23/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class MovementCollectionViewCell: UICollectionViewCell {

    var delegate: CollectionCellDelegator!
    var idMovement = Int()
    
    @IBOutlet weak var movementDetails: UILabel!
    @IBOutlet weak var movementName: UILabel!
    @IBOutlet weak var movementCollectionImage: UIImageView!
    
    @IBAction func buttonInfo(_ sender: Any) {
        if (self.delegate != nil) {
            self.delegate.presentFromButton(id: idMovement)
        }
        
        print("button colview clicked")
        //colView?.performSegue(withIdentifier: "modalPlanSegue", sender: self)
    }
    
    static let identifier = "MovementCollectionViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "MovementCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //self.backgroundColor = UIColor.white
        //self.layer.cornerRadius = 1.0
        // Initialization code
        
        
    }
    
    
    func parseData(data: ExerciseModel){
        
        movementName.text = data.namaExercise
        movementDetails.text = "00:30"
        movementCollectionImage.image = UIImage(named: "donkeykicks")
        idMovement = data.idExercise
    }
    
    
}
