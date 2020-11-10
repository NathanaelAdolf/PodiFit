//
//  NumberExercisesCell.swift
//  PodiFit
//
//  Created by Hafizul Ihsan Fadli on 09/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

protocol CollectionViewCellDelegator {
    func callSegueFromColViewCell()
}

class NumberExercisesCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CollectionViewCellDelegator {
    
    
    static let identifier = "NumberExercisesCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "NumberExercisesCell", bundle: nil)
    }
    
    var colView = UITableViewController()
    @IBOutlet weak var buttonCollection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        setupDelegate()
        setupRegisterNib()
    }
    
    func setupDelegate() {
        buttonCollection.delegate = self
        buttonCollection.dataSource = self
    }
    
    func setupRegisterNib() {
        buttonCollection.register(ButtonExerciseCell.nib(), forCellWithReuseIdentifier: ButtonExerciseCell.identifier)
    }
    
    func setupUI() {
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonExerciseCell.identifier, for: indexPath) as! ButtonExerciseCell
        
        cell.delegate = self
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("colview clicked")
    }
    
    func callSegueFromColViewCell() {
        print("masuk")
        colView.performSegue(withIdentifier: "exerciseListSegue", sender: self)
        print("Jalan")
    }
}
