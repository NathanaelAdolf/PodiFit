//
//  PlanHelper.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 06/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit
import CoreData

class PlanHelper: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func storeToHelperData(idPlan: Int,namaPlan: String,idDifficulty: Int,durasiPlan: Int,durasiSession: Int,choosenExercise: [Int]?)->String
    {
      
          guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return ""}
    
          var message: String = ""

          let context = appDelegate.persistentContainer.viewContext

          let dataOfEntity = NSEntityDescription.entity(forEntityName: "Plan", in: context)!
          let listOfEntity = NSManagedObject(entity: dataOfEntity, insertInto: context)

         listOfEntity.setValue(idPlan, forKey: "idPlan")
        listOfEntity.setValue(namaPlan, forKey: "namaPlan")
        listOfEntity.setValue(idDifficulty, forKey: "idDifficulty")
        listOfEntity.setValue(durasiPlan, forKey: "durasiPlan")
        listOfEntity.setValue(durasiSession, forKey: "durasiSession")
        listOfEntity.setValue(choosenExercise, forKey: "choosenExercise")
  
          do {
              
             try context.save()
              message = "00"
          } catch let error as NSError {
             
              print("Gagal save context \(error), \(error.userInfo)")
              message = "01"
          }
        
        return message
    }
  

}
