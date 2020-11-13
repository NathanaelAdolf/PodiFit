//
//  CustomizePlanTableViewCell.swift
//  PodiFit
//
//  Created by Griffin on 23/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

protocol CollectionCellDelegator {
    func presentFromButton()
    
}

var checkSelected = 0

class CustomizePlanTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    static let identifier = "CustomizePlanTableViewCell"
    var colView: CollectionCellDelegator?
    
    
    
    @IBOutlet weak var movementCollection: UICollectionView!
    
    
    
    func configure (with model: [MovementModel]){
        self.model = model
        movementCollection.reloadData()
    }
    
    var model = [MovementModel]()
    
    
    static func nib() -> UINib{
        return UINib(nibName: "CustomizePlanTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        

        
        movementCollection.register(MovementCollectionViewCell.nib(), forCellWithReuseIdentifier: MovementCollectionViewCell.identifier)
        movementCollection.delegate = self
        movementCollection.dataSource = self
        movementCollection.backgroundColor = UIColor.clear
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? MovementCollectionViewCell{
            
            if cell.layer.borderWidth == 0 {
                checkSelected += 1
                cell.layer.borderWidth = 3.5
                cell.layer.borderColor = Colors.yellowColor.cgColor
                print("indexpath = \(indexPath), status = selected")
            }
            else {
                checkSelected -= 1
                cell.layer.borderWidth = 0
                cell.layer.borderColor = UIColor.clear.cgColor
                print("indexpath = \(indexPath), status = not selected")
            }
            
        }
        //colView?.performSegue(withIdentifier: "modalPlanSegue", sender: self)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovementCollectionViewCell.identifier, for: indexPath) as! MovementCollectionViewCell
        cell.configure(with: model[indexPath.row])
        cell.delegate = colView //kirim dleegate
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 10
        
        //cell.backgroundColor = UIColor.black
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 180)
    }
    
    
}
