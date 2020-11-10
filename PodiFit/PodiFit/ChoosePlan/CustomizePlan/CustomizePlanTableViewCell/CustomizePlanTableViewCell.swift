//
//  CustomizePlanTableViewCell.swift
//  PodiFit
//
//  Created by Griffin on 23/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

protocol CollectionCellDelegator {
    func callSegueFromColViewCell()
}

class CustomizePlanTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CollectionCellDelegator {
    

    static let identifier = "CustomizePlanTableViewCell"
    var colView: UITableViewController?
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
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("colview clicked")
        //colView?.performSegue(withIdentifier: "modalPlanSegue", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovementCollectionViewCell.identifier, for: indexPath) as! MovementCollectionViewCell
        cell.configure(with: model[indexPath.row])
        cell.delegate = self
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 10
        //cell.backgroundColor = UIColor.black
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 180)
    }
 
    func callSegueFromColViewCell() {
        colView?.performSegue(withIdentifier: "modalPlanSegue", sender: self )

    }
    
    
}
