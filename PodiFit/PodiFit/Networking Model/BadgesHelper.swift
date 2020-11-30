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
    
    func retreiveDataFromBadges()->(detailData: [DetailBadgesModel],imageData: [String])
    {
        var tempDetailData = [DetailBadgesModel]()
        var tempImageData = [String]()
        var tempListCompletedPlan = [CompletedPlanModel]()
        tempListCompletedPlan = planHelper.retrieveCompletedPlanData().tempModel
        let totalAllSessionDone = planHelper.retrieveCompletedPlanData().totalSession
        
            guard let appDel = UIApplication.shared.delegate as? AppDelegate else { return (tempDetailData,tempImageData)}
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
                            
                            if data.value(forKey: "firstTimeBadge")as! Bool == true{
                                tempDetailData.append(DetailBadgesModel(imageName: "first time badge.png", title: "1st Time", description: "You have finished your first exercise",progressNum: 1,labelIndicator: "1/1"))
                            }
                            else
                            {
                                tempDetailData.append(DetailBadgesModel(imageName: "first time badge.png", title: "1st Time", description: "You have finished your first exercise",progressNum: 0,labelIndicator: "0/1"))
                            }
                            
                            
                            
                            if data.value(forKey: "customExerciseBadge")as! Bool == true {
                                tempDetailData.append(DetailBadgesModel(imageName: "custom exercise badge.png", title: "Custom Exercise", description: "Create your custom exercise for first time",progressNum: 1,labelIndicator: "1/1"))
                            }
                            else
                            {
                                tempDetailData.append(DetailBadgesModel(imageName: "custom exercise badge.png", title: "Custom Exercise", description: "Create your custom exercise for first time",progressNum: 0,labelIndicator: "0/1"))
                            }
                            
                            
                            
                            if data.value(forKey: "completePlanBadge")as! Bool == true {
                                print("abcdef")
                                tempDetailData.append(DetailBadgesModel(imageName: "completed one plan badge.png", title: "Complete One Plan", description: "You have complete one exercise plan",progressNum: 1,labelIndicator: "1/1"))
                            }
                            else
                            {
                                tempDetailData.append(DetailBadgesModel(imageName: "completed one plan badge.png", title: "Complete One Plan", description: "You have complete one exercise plan",progressNum: 0,labelIndicator: "0/1"))
                            }
                            
                            
                            
                            if data.value(forKey: "completeFivePlanBadge")as! Bool == true{
                                tempDetailData.append(DetailBadgesModel(imageName: "completed five plan badge.png", title: "Goals On Point", description: "Finish 5 exercise plans",progressNum: Float(Float(tempListCompletedPlan.count)/Float(5)),labelIndicator: "\(tempListCompletedPlan.count)/5"))
                            }
                            else
                            {
                                tempDetailData.append(DetailBadgesModel(imageName: "completed five plan badge.png", title: "Goals On Point", description: "Finish 5 exercise plans",progressNum: Float(Float(tempListCompletedPlan.count)/Float(5)),labelIndicator: "\(tempListCompletedPlan.count)/5"))
                            }
                            
                            
                            
                            if data.value(forKey: "reminderBadge")as! Bool == true {
                                tempDetailData.append(DetailBadgesModel(imageName: "reminder badge.png", title: "Exercise routine", description: "Create first reminder for exercise",progressNum: 1,labelIndicator: "1/1"))
                            }
                            else
                            {
                                tempDetailData.append(DetailBadgesModel(imageName: "reminder badge.png", title: "Exercise routine", description: "Create first reminder for exercise",progressNum: 0,labelIndicator: "0/1"))
                            }
                            
                            if data.value(forKey: "exerciseAddictBadge") as! Bool == true {
                                tempDetailData.append(DetailBadgesModel(imageName: "exercise addict badge.png", title: "Exercise Addict", description: "Complete exercise for 7 days in a row",progressNum: Float(Float(totalAllSessionDone)/Float(7)),labelIndicator: "\(totalAllSessionDone)/7"))
                            }else{
                                tempDetailData.append(DetailBadgesModel(imageName: "exercise addict badge.png", title: "Exercise Addict", description: "Complete exercise for 7 days in a row",progressNum: Float(Float(totalAllSessionDone)/Float(7)),labelIndicator: "\(totalAllSessionDone)/7"))
                            }
                            
                            if data.value(forKey: "exerciseMasterBadge")as! Bool == true {
                                tempDetailData.append(DetailBadgesModel(imageName: "exercise master badge.png", title: "Exercise Master", description: "Complete exercise for 30 days in a row",progressNum: Float(Float(totalAllSessionDone)/Float(30)),labelIndicator: "\(totalAllSessionDone)/30"))
                            }
                            else
                            {
                                tempDetailData.append(DetailBadgesModel(imageName: "exercise master badge.png", title: "Exercise Master", description: "Complete exercise for 30 days in a row",progressNum: Float(Float(totalAllSessionDone)/Float(30)),labelIndicator: "\(totalAllSessionDone)/30"))
                            }
                            
                            print("\n")
                            
                        }
                  }
                 catch
                 {
                     print("Failed")
                 }
        
        for i in 0...tempDetailData.count - 1 {
            tempImageData.append(tempDetailData[i].imageName)
        }
        
        return (tempDetailData,tempImageData)
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
            print("berhasil ngeprint\(result)")
            for _ in result as! [NSManagedObject]
            {
                counter += 1
                print("ini counter for \(counter)")
            }
        }
        catch
        {
            print("Failed")
        }
        print("ini counter \(counter)")
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
        fetchRequest.predicate = NSPredicate(format: "id = %@", "1")
        
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
        }catch {
            print("failed")
        }
        
    }
    
    func updateCustomExerciseIntoTrue(isBadgesDone: Bool){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Badges")
        fetchRequest.predicate = NSPredicate(format: "id = %@", "1")
        
        do{
            let fetch = try managedContext.fetch(fetchRequest)
            let dataToUpdate = fetch[0] as! NSManagedObject
        
            dataToUpdate.setValue(isBadgesDone, forKey: "customExerciseBadge")
          
            try managedContext.save()
        }catch {
            print("failed")
        }
        
    }
    
    func updateExerciseAddictIntoTrue(isBadgesDone: Bool){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Badges")
        fetchRequest.predicate = NSPredicate(format: "id = %@", "1")
        
        do{
            let fetch = try managedContext.fetch(fetchRequest)
            let dataToUpdate = fetch[0] as! NSManagedObject
        
            dataToUpdate.setValue(isBadgesDone, forKey: "exerciseAddictBadge")
          
            try managedContext.save()
        }catch {
            print("failed")
        }
        
    }
    
    func updateExerciseMasterIntoTrue(isBadgesDone: Bool){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Badges")
        fetchRequest.predicate = NSPredicate(format: "id = %@", "1")
        
        do{
            let fetch = try managedContext.fetch(fetchRequest)
            let dataToUpdate = fetch[0] as! NSManagedObject
        
            dataToUpdate.setValue(isBadgesDone, forKey: "exerciseMasterBadge")
          
            try managedContext.save()
        }catch {
            print("failed")
        }
        
    }
    
    func updateFirstTimeIntoTrue(isBadgesDone: Bool){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Badges")
        fetchRequest.predicate = NSPredicate(format: "id = %@", "1")
        
        do{
            let fetch = try managedContext.fetch(fetchRequest)
            let dataToUpdate = fetch[0] as! NSManagedObject
        
            dataToUpdate.setValue(isBadgesDone, forKey: "firstTimeBadge")
          
            try managedContext.save()
        }catch {
        }
    }
    
    func checkFirstTimeExercise()->Bool
    {
        var isFirstTime: Bool = false
        
        guard let appDel = UIApplication.shared.delegate as? AppDelegate else { return isFirstTime }
                 let context = appDel.persistentContainer.viewContext
            
                 let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Badges")
             
             do {
                    let result = try context.fetch(fetch)
                    for data in result as! [NSManagedObject]
                     {
                        if data.value(forKey: "firstTimeBadge")as! Bool == true {
                            
                            isFirstTime = true
                        }
                        else
                        {
                            print("ini false")
                            isFirstTime = false
                        }
                        
                    }
              }
             catch
             {
                 print("Failed")
             }
        
        return isFirstTime
    }
    
    func checkPlanIsDoneInTablePlan (idPlan : Int) -> Bool {
        var isFirstTime: Bool = false
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        let fetchRequest = NSFetchRequest<Plan>(entityName: "Plan")
        fetchRequest.predicate = NSPredicate(format: "idPlan == %@", "\(idPlan)")
        
        do {
            let result = try context.fetch(fetchRequest)
            for data in result as! [NSManagedObject]
            {
                if data.value(forKey: "isPlanDone")as! Bool == true {
                    print("ini done")
                    isFirstTime = true
                }
                else
                {
                    print("ini belum done")
                    isFirstTime = false
                }
                
            }
        }
        catch
        {
            print("Failed")
        }
        
        return isFirstTime
    }
    
    
    func checkCompletedPlanBadgeInTableBadges() -> Bool{
        var isBadgesWasTrue: Bool = false
        
        guard let appDel = UIApplication.shared.delegate as? AppDelegate else { return isBadgesWasTrue }
                 let context = appDel.persistentContainer.viewContext
            
                 let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Badges")
             
             do {
                    let result = try context.fetch(fetch)
                    for data in result as! [NSManagedObject]
                     {
                        if data.value(forKey: "completePlanBadge")as! Bool == true {
                            
                            isBadgesWasTrue = true
                        }
                        else
                        {
                            print("ini false")
                            isBadgesWasTrue = false
                        }
                        
                    }
              }
             catch
             {
                 print("Failed")
             }
        
        return isBadgesWasTrue
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
        }catch {
            print("Failed")
        }
        
    }
    
    
    func checkUserEarnBadge()
    {
        var tempCompletedData = [CompletedPlanModel]()
        tempCompletedData = planHelper.retrieveCompletedPlanData().tempModel
        var totalAllSessionDone = planHelper.retrieveCompletedPlanData().totalSession
        
        var isFinishedOneExercise: Bool = false
        isFinishedOneExercise = planHelper.retrieveCompletedPlanData().isFinishedOneExercise
    
        
        let userIdPlan: [Int] = userHelper.retrieveUserBasicData()[0].userIdPlan!
        var customIdPlan = [Int]()
        
        if userIdPlan.count == 0 {
            print("check user id plan empty")
            return
        }
        
        for i in 0...userIdPlan.count - 1 {
            if userIdPlan[i] > 2 {
                customIdPlan.append(userIdPlan[i])
            }
        }
        
        if notifHelper.isReminderTableEmpty() == false {
            //tempBadgeString.append("")nanti append buat tambahin gambarnya di home, samain dgn semuanya
           // print("Reminder badges earn")
            badgesHelper.updateReminderBadgeIntoTrue(isBadgesDone: true)
            
        }
        if tempCompletedData.count != 0 {
            badgesHelper.updateCompletePlanIntoTrue(isBadgesDone: true)
            print("finish one plan")
        }
        
        if tempCompletedData.count >= 5 {
            badgesHelper.update5PlanIntoTrue(isBadgesDone: true)
           // print("Finish 5 plans")
        }
        
        if customIdPlan.count >= 1 {
            badgesHelper.updateCustomExerciseIntoTrue(isBadgesDone: true)
            //print("Success custom exercise")
        }
        
        if isFinishedOneExercise == true {
            badgesHelper.updateFirstTimeIntoTrue(isBadgesDone: true)
            //print("Success finish one exercise")
        }
        
        if totalAllSessionDone >= 7 {
            badgesHelper.updateExerciseAddictIntoTrue(isBadgesDone: true)
            //print("exercise addict earn")
        }
        
        if totalAllSessionDone >= 30 {
            badgesHelper.updateExerciseMasterIntoTrue(isBadgesDone: true)
            //print("exercise master earn")
        }
        
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
        }catch {
            print("failed")
        }
    }
}
