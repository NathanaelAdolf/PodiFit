
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
    
    func storeToPlanData(idPlan: Int,namaPlan: String,idDifficulty: Int,durasiPlan: Int,durasiSessionDay: Int,jumlahHari: Int, totalSessionDone: Int, choosenExercise: [Int]?,isPlanDone: Bool,description: String)
    {
      
          guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return}

          let context = appDelegate.persistentContainer.viewContext

          let dataOfEntity = NSEntityDescription.entity(forEntityName: "Plan", in: context)!
          let listOfEntity = NSManagedObject(entity: dataOfEntity, insertInto: context)

         listOfEntity.setValue(idPlan, forKey: "idPlan")
        listOfEntity.setValue(namaPlan, forKey: "namaPlan")
        listOfEntity.setValue(idDifficulty, forKey: "idDifficulty")
        listOfEntity.setValue(durasiPlan, forKey: "durasiPlan")
        listOfEntity.setValue(durasiSessionDay, forKey: "durasiSessionDay")
        listOfEntity.setValue(jumlahHari, forKey: "jumlahHari")
        listOfEntity.setValue(totalSessionDone, forKey: "totalSessionDone")
        listOfEntity.setValue(choosenExercise, forKey: "chosenExercise")
        listOfEntity.setValue(isPlanDone, forKey: "isPlanDone")
        listOfEntity.setValue(description, forKey: "desc")
  
          do {
              
             try context.save()
             
          } catch let error as NSError {
             
              print("Gagal save context \(error), \(error.userInfo)")
             
          }
        
    }
    
    func retrievePlanData()
    {
        guard let appDel = UIApplication.shared.delegate as? AppDelegate else { return}
                 let context = appDel.persistentContainer.viewContext
            
                 let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Plan")
             
             do {
                    let result = try context.fetch(fetch)
                    for data in result as! [NSManagedObject]
                     {
                        print("id Plan : \(data.value(forKey: "idPlan")as! Int)")
                        print("nama Plan : \(data.value(forKey: "namaPlan")as! String)")
                        print("id difficulty : \(data.value(forKey: "idDifficulty")as! Int)")
                        print("durasi plan : \(data.value(forKey: "durasiPlan")as! Int)")
                        print("durasi session day : \(data.value(forKey: "durasiSessionDay")as! Int)")
                        print("jumlah hari: \(data.value(forKey: "jumlahHari")as! Int)")
                        print("totalSessionDone : \(data.value(forKey: "totalSessionDone")as! Int)")
                        print("choosen Exercise : \(data.value(forKey: "chosenExercise")as! [Int]?)")
                        print("is Plan done : \(data.value(forKey: "isPlanDone")as! Bool)")
                        
                        print("\n")
                    }
              }
             catch
             {
                 print("Failed")
             }
        
    }
    
    func updatePlanIntoDone(planNameToUpdate: String,isPlanDone: Bool){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Plan")
        fetchRequest.predicate = NSPredicate(format: "namaPlan = %@", planNameToUpdate)
        
        do{
            let fetch = try managedContext.fetch(fetchRequest)
            let dataToUpdate = fetch[0] as! NSManagedObject
        
            dataToUpdate.setValue(isPlanDone, forKey: "isPlanDone")
          
            try managedContext.save()
        }catch let err{
            print(err)
        }
        
    }
    
    func retrieveCompletedPlanData()-> (tempModel: [CompletedPlanModel], isFinishedOneExercise: Bool,totalSession: Int)
    {
        var tempCompletedPlanData = [CompletedPlanModel]()
        tempCompletedPlanData = []
        let userIdPlan: [Int] = userHelper.retrieveUserBasicData()[0].userIdPlan!
        var isFinishedOneExercise: Bool = false
        var totalAllSessionDone: Int = 0
        
        guard let appDel = UIApplication.shared.delegate as? AppDelegate else { return (tempCompletedPlanData,isFinishedOneExercise,totalAllSessionDone)}
                 let context = appDel.persistentContainer.viewContext
                 let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Plan")
             
             do {
                    let result = try context.fetch(fetch)
                    for data in result as! [NSManagedObject]
                     {
                            for i in 0...userIdPlan.count - 1
                            {
                                if userIdPlan[i] == data.value(forKey: "idPlan")as! Int
                                {
                                    if data.value(forKey: "isPlanDone")as! Bool == true
                                    {
                                    tempCompletedPlanData.append(CompletedPlanModel(titleMovement: data.value(forKey: "namaPlan")as! String, level: difficultyHelper.checkDifficultyNameById(idDifficulty: data.value(forKey: "idDifficulty")as! Int), period: data.value(forKey: "durasiPlan")as! Int, movement: 10))
                                    }
                                    
                                    if data.value(forKey: "totalSessionDone")as! Int != 0 {
                                        isFinishedOneExercise = true
                                    }
                                    totalAllSessionDone += data.value(forKey: "totalSessionDone")as! Int

                                }
                                
                            }
                        
                        
                        print("\n")
                    }
              }
             catch
             {
                 print("Failed")
             }
       
        return (tempCompletedPlanData,isFinishedOneExercise,totalAllSessionDone)
        
    }
    
    func isPlanTableEmpty()->Bool
    {
        
        var counter: Int = 0
        var isTableEmpty = Bool()
        
        guard let appDel = UIApplication.shared.delegate as? AppDelegate else { return isTableEmpty}
                 let context = appDel.persistentContainer.viewContext
            
                 let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Plan")
             
             do {
                    let result = try context.fetch(fetch)
                    for data in result as! [NSManagedObject]
                     {
                        counter += 1
                        
                    }
              }
             catch
             {
                 print("Failed")
             }
        
        if counter == 0 {
            isTableEmpty = true
        }else{
            isTableEmpty = false
        }
        
        return isTableEmpty
    }
  

}
