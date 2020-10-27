//
//  CustomizePlanTableViewCell.swift
//  PodiFit
//
//  Created by Griffin on 23/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class CustomizePlanTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    static let identifier = "CustomizePlanTableViewCell"
    
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
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 1.0
        
        movementCollection.register(MovementCollectionViewCell.nib(), forCellWithReuseIdentifier: MovementCollectionViewCell.identifier)
        movementCollection.delegate = self
        movementCollection.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovementCollectionViewCell.identifier, for: indexPath) as! MovementCollectionViewCell
        cell.configure(with: model[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 160)
    }
}
