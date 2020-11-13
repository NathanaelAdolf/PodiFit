//
//  NumberExercisesCell.swift
//  PodiFit
//
//  Created by Hafizul Ihsan Fadli on 09/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class NumberExercisesCell: UITableViewCell {
    
    static let identifier = "NumberExercisesCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "NumberExercisesCell", bundle: nil)
    }
    
    var delegate : ShowPlanVC?
    
    @IBOutlet weak var buttonCollection: UICollectionView!
    @IBOutlet weak var weekLabel: UILabel!
    
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
    
    func parseData(data: [Int]) {
        data.forEach { (i) in
            weekLabel.text = "Week \(i) Exercise"
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension NumberExercisesCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonExerciseCell.identifier, for: indexPath) as! ButtonExerciseCell
        
        cell.delegate = delegate
        
        return cell
    }
}
