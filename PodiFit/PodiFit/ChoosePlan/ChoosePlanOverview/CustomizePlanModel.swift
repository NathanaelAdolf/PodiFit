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
    
    func checkPlanIndex()->Int
    {
        var counter: Int = 0
        
        guard let appDel = UIApplication.shared.delegate as? AppDelegate else { return 0}
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
                 print("Error counting data")
             }
        
        
        return counter
    }
    
    func storeCustomPlanData(idPlan: Int,namaPlan: String,idDifficulty: Int,durasiPlan: Int,durasiSessionDay: Int,jumlahHari: Int, totalSessionDone: Int, choosenExercise: [Int]?,isPlanDone: Bool,description: String)
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
    
    func fetchIdSteps(idExercise: Int) -> [StepModel]{
        var stepExercises = [StepModel]()
        let fetchRequest = NSFetchRequest<Exercise>(entityName: "Exercise")
        print("ini \(idExercise)")
        fetchRequest.predicate = NSPredicate(format: "idExercise == %@", "\(idExercise)")
        
        do {
            let exercises = try context.fetch(fetchRequest)
            for exercise in exercises {
                let tempStep : Set<ExerciseSteps> = exercise.steps as! Set<ExerciseSteps>
                let arrTempStep = Array(tempStep)

                arrTempStep.forEach { (arr) in
                    stepExercises.append(
                        StepModel(idStep: arr.value(forKey: "idStep") as! Int,
                                  steps: arr.value(forKey: "steps") as! String)
                    )
                }
            }
        } catch  {
            print("error")
        }
        print("ini step \(stepExercises)")
        return stepExercises
    }
}
