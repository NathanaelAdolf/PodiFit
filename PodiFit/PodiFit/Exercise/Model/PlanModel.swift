//
//  PlanModel.swift
//  PodiFit
//
//  Created by Muhamad Vicky on 04/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit
import CoreData

class PlanModel: UIViewController {

    //reference to moc
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    func fetchPlan() -> [Plan]{
        // for temporary data
        var tempPlanModel = [Plan]()
        
        // reference to moc with return
        guard let appDel = UIApplication.shared.delegate as? AppDelegate else { return tempPlanModel}
        
        // fetch data in table Plan
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Plan")
        
        do {
            let result = try context.fetch(fetch)
            for data in result as! [NSManagedObject]{
                print(data.value(forKey: "chosenExercise"))
            }
        } catch {
            
        }
        
        return tempPlanModel
        
    }
    
    //
    func fetchExerciseByIdPlan(idPlan : Int) -> [Int]? {
        
        var idExercieses : [Int]? = []
        
//        let managedObjectContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Plan>(entityName: "Plan")
        fetchRequest.predicate = NSPredicate(format: "idPlan == %@", "\(idPlan)")
        
        do {

            let result = try context.fetch(fetchRequest) as [NSManagedObject]
            
            result.forEach { (plan) in
                let getIdExercise = plan.value(forKey: "chosenExercise") as? [Int]?
                idExercieses = getIdExercise?.unsafelyUnwrapped
            }
            
//            for plan in plans {
//                let tempExercise : Set<Exercise> = plan.exercise as! Set<Exercise>
//                let arrTempExercise = Array(tempExercise)
//                for arrTemp in arrTempExercise {
//                    print(arrTemp.namaExercise)
//
//
//                }
//
//            }
        } catch  {
            print("error")
        }
        
        return idExercieses
    }
    
    func fetchIdSteps(idExercise: [Int]) -> [StepModel]{
        var stepExercises = [StepModel]()
        
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
//
//        let managedObjectContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Exercise>(entityName: "Exercise")
        fetchRequest.predicate = NSPredicate(format: "idExercise == %@", "1")
        
        do {
            let exercises = try context.fetch(fetchRequest)
//            print(exercises.count)
            for exercise in exercises {
                
                print("//masuk")
//                print(exercise.steps?. ?? "No Data Found")
                let tempStep : Set<ExerciseSteps> = exercise.steps as! Set<ExerciseSteps>
                let arrTempStep = Array(tempStep)
//                print(bebas)
                
//                for arrTemp in arrTempStep {
//                    print(arrTemp.steps)
//                }
                arrTempStep.forEach { (arr) in
                    stepExercises.append(
                        StepModel(idStep: value(forKey: "idStep") as! Int,
                                  steps: value(forKey: "steps") as! String)
                    )
                }
            }
        } catch  {
            print("error")
        }
        
        return stepExercises
    }
    
    func fetchIdWarning(warningData : [Int]) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Exercise>(entityName: "Exercise")
        
        fetchRequest.predicate = NSPredicate(format: "warningData == %@", "1")
        
        do {
            let exercises = try managedObjectContext.fetch(fetchRequest)
//            print(exercises.count)
            for exercise in exercises {
                
                print("//masuk")
//                print(exercise.steps?. ?? "No Data Found")
                let tempWarning : Set<Warning> = exercise.warning as! Set<Warning>
                let arrTempWarning = Array(tempWarning)
//                print(bebas)
                
                for arrTemp in arrTempWarning {
                    print(arrTemp.warningText)
                }
            }
        } catch  {
            print("error")
        }
    }
    
    

}
