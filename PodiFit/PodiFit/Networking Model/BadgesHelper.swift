//
//  BadgesHelper.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 08/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit
import CoreData

class BadgesHelper: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func storeToBadgesData(id: Int,complete5Plan: Bool,completePlan: Bool,customExercise: Bool,exerciseAddict: Bool,exerciseMaster: Bool,firstTimeBadge: Bool,reminderBadge: Bool)
    {
      
          guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return}
    

          let context = appDelegate.persistentContainer.viewContext

          let dataOfEntity = NSEntityDescription.entity(forEntityName: "Badges", in: context)!
          let listOfEntity = NSManagedObject(entity: dataOfEntity, insertInto: context)

        listOfEntity.setValue(id, forKey: "id")
         listOfEntity.setValue(complete5Plan, forKey: "completeFivePlanBadge")
        listOfEntity.setValue(completePlan, forKey: "completePlanBadge")
        listOfEntity.setValue(customExercise, forKey: "customExerciseBadge")
        listOfEntity.setValue(exerciseAddict, forKey: "exerciseAddictBadge")
        listOfEntity.setValue(exerciseMaster, forKey: "exerciseMasterBadge")
        listOfEntity.setValue(firstTimeBadge, forKey: "firstTimeBadge")
        listOfEntity.setValue(reminderBadge, forKey: "reminderBadge")
   
          do {
              
             try context.save()
          } catch let error as NSError {
             
              print("Gagal save context \(error), \(error.userInfo)")
          }
        
    }
    
    func retreiveDataFromBadges()
    {
        
            guard let appDel = UIApplication.shared.delegate as? AppDelegate else { return}
                     let context = appDel.persistentContainer.viewContext
                
                     let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Badges")
                 
                 do {
                        let result = try context.fetch(fetch)
                        for data in result as! [NSManagedObject]
                         {
                            print("complete 5 plan : \(data.value(forKey: "completeFivePlanBadge")as! Bool)")
                            print("complete plan badge : \(data.value(forKey: "completePlanBadge")as! Bool)")
                            print("custom exercise : \(data.value(forKey: "customExerciseBadge")as! Bool)")
                            print("exercise addict : \(data.value(forKey: "exerciseAddictBadge")as! Bool)")
                            print("exercise master : \(data.value(forKey: "exerciseMasterBadge")as! Bool)")
                            print("first time badge : \(data.value(forKey: "firstTimeBadge")as! Bool)")
                            print("reminder badge : \(data.value(forKey: "reminderBadge")as! Bool)")
                            
                            
                            print("\n")
                        }
                  }
                 catch
                 {
                     print("Failed")
                 }
    }
    
    func isBadgesTableEmpty()->Bool
    {
        var counter: Int = 0
        var isBadgesEmpty: Bool = false
        
        guard let appDel = UIApplication.shared.delegate as? AppDelegate else { return isBadgesEmpty}
                 let context = appDel.persistentContainer.viewContext
            
                 let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Badges")
             
             do {
                    let result = try context.fetch(fetch)
                for _ in result as! [NSManagedObject]
                     {
                        counter += 1
                    }
              }
             catch
             {
                 print("Failed")
             }
        
        if counter == 0 {
            isBadgesEmpty = true
        }
        else
        {
            isBadgesEmpty = false
        }
        
        return isBadgesEmpty
    }
    
    func update5PlanIntoTrue(isBadgesDone: Bool){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Badges")
        fetchRequest.predicate = NSPredicate(format: "id = %@", 1)
        
        do{
            let fetch = try managedContext.fetch(fetchRequest)
            let dataToUpdate = fetch[0] as! NSManagedObject
        
            dataToUpdate.setValue(isBadgesDone, forKey: "completeFivePlanBadge")
          
            try managedContext.save()
        }catch let err{
            print(err)
        }
        
    }
    
    func updateCompletePlanIntoTrue(isBadgesDone: Bool){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Badges")
        fetchRequest.predicate = NSPredicate(format: "id = %@", "1")
        
        do{
            let fetch = try managedContext.fetch(fetchRequest)
            let dataToUpdate = fetch[0] as! NSManagedObject
        
            dataToUpdate.setValue(isBadgesDone, forKey: "completePlanBadge")
          
            try managedContext.save()
        }catch let err{
            print(err)
        }
        
    }
    
    func updateCustomExerciseIntoTrue(isBadgesDone: Bool){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Badges")
        fetchRequest.predicate = NSPredicate(format: "id = %@", 1)
        
        do{
            let fetch = try managedContext.fetch(fetchRequest)
            let dataToUpdate = fetch[0] as! NSManagedObject
        
            dataToUpdate.setValue(isBadgesDone, forKey: "customExerciseBadge")
          
            try managedContext.save()
        }catch let err{
            print(err)
        }
        
    }
    
    func updateExerciseAddictIntoTrue(isBadgesDone: Bool){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Badges")
        fetchRequest.predicate = NSPredicate(format: "id = %@", 1)
        
        do{
            let fetch = try managedContext.fetch(fetchRequest)
            let dataToUpdate = fetch[0] as! NSManagedObject
        
            dataToUpdate.setValue(isBadgesDone, forKey: "exerciseAddictBadge")
          
            try managedContext.save()
        }catch let err{
            print(err)
        }
        
    }
    
    func updateExerciseMasterIntoTrue(isBadgesDone: Bool){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Badges")
        fetchRequest.predicate = NSPredicate(format: "id = %@", 1)
        
        do{
            let fetch = try managedContext.fetch(fetchRequest)
            let dataToUpdate = fetch[0] as! NSManagedObject
        
            dataToUpdate.setValue(isBadgesDone, forKey: "exerciseMasterBadge")
          
            try managedContext.save()
        }catch let err{
            print(err)
        }
        
    }
    
    func updateFirstTimeIntoTrue(isBadgesDone: Bool){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Badges")
        fetchRequest.predicate = NSPredicate(format: "id = %@", 1)
        
        do{
            let fetch = try managedContext.fetch(fetchRequest)
            let dataToUpdate = fetch[0] as! NSManagedObject
        
            dataToUpdate.setValue(isBadgesDone, forKey: "firstTimeBadge")
          
            try managedContext.save()
        }catch let err{
            print(err)
        }
        
    }
    
    func updateReminderBadgeIntoTrue(isBadgesDone: Bool){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Badges")
        fetchRequest.predicate = NSPredicate(format: "id = %@", "1")
        
        do{
            let fetch = try managedContext.fetch(fetchRequest)
            let dataToUpdate = fetch[0] as! NSManagedObject
        
            dataToUpdate.setValue(isBadgesDone, forKey: "reminderBadge")
          
            try managedContext.save()
        }catch let err{
            print(err)
        }
        
    }
    
    
    func checkUserEarnBadge()->[String]
    {
        let tempBadgeString: [String] = []
        
        var tempCompletedData = [CompletedPlanModel]()
        tempCompletedData = planHelper.retrieveCompletedPlanData()
        
        if notifHelper.isReminderTableEmpty() == false {
            //tempBadgeString.append("")nanti append buat tambahin gambarnya di home, samain dgn semuanya
            print("Reminder badges earn")
            badgesHelper.updateReminderBadgeIntoTrue(isBadgesDone: true)
            
        }
        if tempCompletedData.count != 0 {
            badgesHelper.updateCompletePlanIntoTrue(isBadgesDone: true)
            print("finish one plan")
        }
        
        
        return tempBadgeString
    }
    
    func deleteReminderBadgesOneRow(uniqueType: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Badges")
        fetchRequest.predicate = NSPredicate(format: "exerciseMasterBadge = %@", uniqueType)
        
        do{
            let dataToDelete = try managedContext.fetch(fetchRequest)[0] as! NSManagedObject
            managedContext.delete(dataToDelete)
            
            try managedContext.save()
        }catch let err{
            print(err)
        }
    }
}
