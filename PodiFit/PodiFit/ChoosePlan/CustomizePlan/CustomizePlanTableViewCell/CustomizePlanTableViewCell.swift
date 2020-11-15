//
//  CustomizePlanTableViewCell.swift
//  PodiFit
//
//  Created by Griffin on 23/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

protocol CollectionCellDelegator {
    func presentFromButton(id: Int)
    
}

var checkSelected = 0
var newSelectedExercise = [Int]()

class CustomizePlanTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    static let identifier = "CustomizePlanTableViewCell"
    var colView: CollectionCellDelegator?
    var arraySelectedExercise = [Int]()
    var tempSelectedExercise = [Int]()
    var selectedIndexPlan: Int!

    @IBOutlet weak var movementCollection: UICollectionView!
    
    // // //
    
    var data = [ExerciseModel]()
    
    func parseData(data: [ExerciseModel]){
        self.data = data
        movementCollection.reloadData()
    }
    
    // // //
    
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
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? MovementCollectionViewCell{
            
            if cell.layer.borderWidth == 0 {
                checkSelected += 1
                cell.layer.borderWidth = 3.5
                cell.layer.borderColor = Colors.yellowColor.cgColor
                print("indexpath = \(indexPath), status = selected")
                
                tempSelectedExercise.append(cell.idMovement)
                print("temp = \(tempSelectedExercise)")
                newSelectedExercise = tempSelectedExercise
            }
            else {
                checkSelected -= 1
                cell.layer.borderWidth = 0
                cell.layer.borderColor = UIColor.clear.cgColor
                print("indexpath = \(indexPath), status = not selected")
                
                if let index = tempSelectedExercise.firstIndex(of: cell.idMovement) {
                    tempSelectedExercise.remove(at: index)
                }
                print("temp = \(tempSelectedExercise)")
                newSelectedExercise = tempSelectedExercise
            }
            
        }
        //colView?.performSegue(withIdentifier: "modalPlanSegue", sender: self)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovementCollectionViewCell.identifier, for: indexPath) as! MovementCollectionViewCell
        //cell.configure(with: model[indexPath.row])
        cell.parseData(data: data[indexPath.row])
        cell.delegate = colView //kirim delegate
        
        print("cellid = \(cell.idMovement)")
        
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 10
        
        if (arraySelectedExercise.contains(cell.idMovement)) {
            print("masuk")
            checkSelected += 1
            cell.layer.borderWidth = 3.5
            cell.layer.borderColor = Colors.yellowColor.cgColor
            print("indexpath = \(indexPath), status = alr selected")
            newSelectedExercise = tempSelectedExercise
        }
        
        //cell.backgroundColor = UIColor.black
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 180)
    }
    
    
}
