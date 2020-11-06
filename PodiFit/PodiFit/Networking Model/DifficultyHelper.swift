//
//  DifficultyHelper.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 06/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit
import CoreData

class DifficultyHelper: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func checkDifficultyNameById(idDifficulty: Int)->String
    {
        
        guard let appDel = UIApplication.shared.delegate as? AppDelegate else {return ""}
                 let context = appDel.persistentContainer.viewContext
            
                 let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Difficulty")
             
             do {
                    let result = try context.fetch(fetch)
                    for data in result as! [NSManagedObject]
                     {
                        if data.value(forKey: "idDifficulty")as! Int == idDifficulty {
                            return data.value(forKey: "levelDifficulty")as! String
                        }
                        
                        
                    }
              }
             catch
             {
                 print("Failed")
             }

    
        return ""
    }
    
    func storeToDifficultyData(idDifficulty: Int, levelDifficulty: String)
    {
          guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return}
    
          let context = appDelegate.persistentContainer.viewContext

          let dataOfEntity = NSEntityDescription.entity(forEntityName: "Difficulty", in: context)!
          let listOfEntity = NSManagedObject(entity: dataOfEntity, insertInto: context)

         listOfEntity.setValue(idDifficulty, forKey: "idDifficulty")
         listOfEntity.setValue(levelDifficulty, forKey: "levelDifficulty")
        
          do {
              
             try context.save()
             
          } catch let error as NSError {
             
              print("Gagal save context \(error), \(error.userInfo)")
          }
        
        return
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
