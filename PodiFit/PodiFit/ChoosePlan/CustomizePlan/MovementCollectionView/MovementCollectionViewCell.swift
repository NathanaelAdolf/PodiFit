//
//  MovementCollectionViewCell.swift
//  PodiFit
//
//  Created by Griffin on 23/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class MovementCollectionViewCell: UICollectionViewCell {

    var colView: UITableViewController?
    var delegate: CollectionCellDelegator!
    
    @IBOutlet weak var movementDetails: UILabel!
    @IBOutlet weak var movementName: UILabel!
    @IBOutlet weak var movementCollectionImage: UIImageView!
    
    @IBAction func buttonInfo(_ sender: Any) {
        if (self.delegate != nil) {
            self.delegate.callSegueFromColViewCell()
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
    
    public func configure(with model: MovementModel){
        
        self.movementName.text = model.movementName
        self.movementDetails.text = model.movementDetail
        self.movementCollectionImage.image = UIImage(named: model.movementImage)
        
        
    }
    
    
}
