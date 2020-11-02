//
//  BadgesTableViewCell.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 31/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class BadgesTableViewCell: UITableViewCell, UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet var badgesCollectionView: UICollectionView!
    
    var badgesImageArray: [String] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        badgesImageArray.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "badgesCollectionViewCell", for: indexPath) as! BadgesCollectionViewCell
        
        cell.badgesImage.image = UIImage(named: badgesImageArray[indexPath.row])
        
        return cell
    }
    
    func loadCollectionView(data: [String])
    {
        self.badgesImageArray = data
        
        badgesCollectionView.reloadData()
    }
    

    @IBOutlet var badgesBackgroundView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        badgesBackgroundView.layer.cornerRadius = 5
        badgesBackgroundView.backgroundColor = Colors.cellColor
        badgesCollectionView.backgroundColor = .none
        self.backgroundColor = .none
        
        badgesCollectionView.delegate = self
        badgesCollectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
