//
//  CustomizePlanModel.swift
//  PodiFit
//
//  Created by Griffin on 13/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit
import CoreData

class CustomizePlanModel: UIViewController {
    
    //reference to moc
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchAllPlan() -> [PlansModel]{
        // for temporary data
        var plans = [PlansModel]()
        
        // fetch data in table Plan
        let fetchRequest = NSFetchRequest<Plan>(entityName: "Plan")
        
        do {
            let result = try context.fetch(fetchRequest) as [NSManagedObject]
            
            result.forEach { (plan) in
                plans.append(
                    PlansModel(
                        chosenExercise: plan.value(forKey: "chosenExercise") as? [Int],
                        desc: plan.value(forKey: "desc") as? String,
                        durasiPlan: plan.value(forKey: "durasiPlan") as! Int32,
                        durasiSessionDay: plan.value(forKey: "durasiSessionDay") as! Int64,
                        idDifficulty: plan.value(forKey: "idDifficulty") as! Int32,
                        idPlan: plan.value(forKey: "idPlan") as! Int32,
                        isPlanDone: (plan.value(forKey: "isPlanDone") != nil),
                        jumlahHari: plan.value(forKey: "jumlahHari") as! Int32,
                        namaPlan: (plan.value(forKey: "namaPlan") as! String),
                        totalSessionDone: plan.value(forKey: "totalSessionDone") as! Int32,
                        exercise: (plan.value(forKey: "exercise") as! NSSet)
                    )
                )
            }
            
        }
        catch let err {
            print(err)
        }
        
        return plans
    }
    
    func fetchActivePlan() -> [PlansModel]{
        
        // for temporary data
        var plans = [PlansModel]()
        
        // get idPlan from Array User
            
            let fetchRequest = NSFetchRequest<Plan>(entityName: "Plan")
            
            do {
                let result = try context.fetch(fetchRequest) as [NSManagedObject]
                
                // Loop data Plan into PlansModel
                result.forEach { (plan) in
                    plans.append(
                        PlansModel(
                            chosenExercise: plan.value(forKey: "chosenExercise") as? [Int],
                            desc: plan.value(forKey: "desc") as? String,
                            durasiPlan: plan.value(forKey: "durasiPlan") as! Int32,
                            durasiSessionDay: plan.value(forKey: "durasiSessionDay") as! Int64,
                            idDifficulty: plan.value(forKey: "idDifficulty") as! Int32,
                            idPlan: plan.value(forKey: "idPlan") as! Int32,
                            isPlanDone: (plan.value(forKey: "isPlanDone") != nil),
                            jumlahHari: plan.value(forKey: "jumlahHari") as! Int32,
                            namaPlan: (plan.value(forKey: "namaPlan") as! String),
                            totalSessionDone: plan.value(forKey: "totalSessionDone") as! Int32,
                            exercise: (plan.value(forKey: "exercise") as! NSSet)
                        )
                    )
                }
            }
            catch let err {
                print(err)
            }
        print(plans.count)
        return plans
        
    }
    
    func fetchSelectedExercise(idPlan: Int) -> [ExerciseModel]{
        
        // for temporary data
        var exercises = [ExerciseModel]()
        
        // get idPlan from Array User
        let idExerciseArray = fetchIdExercises(idPlan: idPlan)
        
        var idExercise: String = ""
        
        // Loop idPlan available from user
        idExerciseArray?.forEach({ (id) in
            idExercise = "\(id)"
            
            let fetchRequest = NSFetchRequest<Exercise>(entityName: "Exercise")
            fetchRequest.predicate = NSPredicate(format: "idExercise == %@", idExercise) // select Plan where idPlan like in User
            
            do {
                let result = try context.fetch(fetchRequest) as [NSManagedObject]
                
                // Loop data Plan into PlansModel
                result.forEach { (exercise) in
                    exercises.append(
                        ExerciseModel(
                            idDifficulty: exercise.value(forKey: "idDifficulty") as! Int,
                            idExercise: exercise.value(forKey: "idExercise") as! Int,
                            listIdSteps: exercise.value(forKey: "listIdSteps") as? [Int],
                            namaExercise: exercise.value(forKey: "namaExercise") as! String,
                            videoUrl: exercise.value(forKey: "videoUrl") as! String,
                            warningData: exercise.value(forKey: "warningData") as? [Int]
                        )
                    )
                }
            }
            catch let err {
                print(err)
            }
        })
        return exercises
        
    }
    
    func fetchIdPlan() -> [Int]? {
        
        var idPlan: [Int]? = []
        
        let fetchRequest = NSFetchRequest<User>(entityName: "User")
        
        do {
            let result = try context.fetch(fetchRequest) as [NSManagedObject]
            
            result.forEach { (user) in
                let getIdPlan = user.value(forKey: "userIdPlan") as? [Int]?
                idPlan = getIdPlan?.unsafelyUnwrapped
            }
        }
        catch let err {
            print(err)
        }
        
        return idPlan
    }
    
    func fetchIdExercises(idPlan: Int) -> [Int]? {
        
        var idExercieses: [Int]? = []
        
        let fetchRequest = NSFetchRequest<Plan>(entityName: "Plan")
        fetchRequest.predicate = NSPredicate(format: "idPlan == %@", "\(idPlan)") // select Plan where idPlan like in User
        
        do {
            let result = try context.fetch(fetchRequest) as [NSManagedObject]
            
            result.forEach { (plan) in
                let getIdExercise = plan.value(forKey: "chosenExercise") as? [Int]?
                idExercieses = getIdExercise?.unsafelyUnwrapped
            }
        }
        catch let err {
            print(err)
        }
        
        return idExercieses
    }
    
    func fetchExerciseByIdDifficulty(idDifficulty: Int) -> [ExerciseModel]? {
        var tempExercise = [ExerciseModel]()
        
        let fetchRequest = NSFetchRequest<Exercise>(entityName: "Exercise")
        fetchRequest.predicate = NSPredicate(format: "idDifficulty == %@", "\(idDifficulty)")
        
        do{
            let result = try context.fetch(fetchRequest) as [NSManagedObject]
            
            result.forEach { (exercise) in
                tempExercise.append(
                    ExerciseModel(
                        idDifficulty: exercise.value(forKey: "idDifficulty") as! Int,
                        idExercise: exercise.value(forKey: "idExercise") as! Int,
                        listIdSteps: exercise.value(forKey: "listIdSteps") as? [Int],
                        namaExercise: exercise.value(forKey: "namaExercise") as! String,
                        videoUrl: exercise.value(forKey: "videoUrl") as! String,
                        warningData: exercise.value(forKey: "warningData") as? [Int]
                    )
                )
            }
        }
        catch let err {
            print(err)
        }
        
        return tempExercise
    }
    
    func getExercise(idExercise: Int) -> ExerciseModel?{
        var exerciseData: ExerciseModel!
        
        let fetchRequest = NSFetchRequest<Exercise>(entityName: "Exercise")
        fetchRequest.predicate = NSPredicate(format: "idExercise == %@", "\(idExercise)")
        
        do{
            let result = try context.fetch(fetchRequest) as [NSManagedObject]
            
            for exercise in result{
                exerciseData = ExerciseModel(idDifficulty: exercise.value(forKey: "idDifficulty") as! Int, idExercise: exercise.value(forKey: "idExercise") as! Int, listIdSteps: exercise.value(forKey: "listIdSteps") as? [Int], namaExercise: exercise.value(forKey: "namaExercise") as! String, videoUrl: exercise.value(forKey: "videoUrl") as! String, warningData: exercise.value(forKey: "warningData") as? [Int])
            }
                
        }
        catch let err {
            print(err)
        }
        
        return exerciseData
    }
    
    func countWeekPlan(idPlan: Int) -> Int {
        // for temporary data
        var weekPlan: Int!
        
        let fetchRequest = NSFetchRequest<Plan>(entityName: "Plan")
        fetchRequest.predicate = NSPredicate(format: "idPlan == %@", "\(idPlan)") // select Plan where idPlan like in User
        
        do {
            let result = try context.fetch(fetchRequest) as [NSManagedObject]
            
            // Loop data Plan into PlansModel
            result.forEach { (plan) in
                weekPlan = plan.value(forKey: "durasiPlan") as? Int
            }
        }
        catch let err {
            print(err)
        }
        
        return weekPlan
    }
}
