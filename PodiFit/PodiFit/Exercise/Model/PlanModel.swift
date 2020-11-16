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
    

    
    //
    func fetchExerciseIdByIdPlan(idPlan : Int) -> [Int]? {
        
        var idExercises : [Int]? = []
        
        let fetchRequest = NSFetchRequest<Plan>(entityName: "Plan")
        fetchRequest.predicate = NSPredicate(format: "idPlan == %@", "\(idPlan)")
        do {
            let results = try context.fetch(fetchRequest)
            for result in results {
                let getIdExercise = result.value(forKey: "chosenExercise") as? [Int]?
                idExercises = getIdExercise?.unsafelyUnwrapped
            }
        } catch  {
            print("error")
        }
        return idExercises
    }
    
    func fetchExerciseDetail(idExercise : Int) -> [ExerciseModel] {
        
        var exerciseData = [ExerciseModel]()
        let fetchRequest = NSFetchRequest<Exercise>(entityName: "Exercise")
        fetchRequest.predicate = NSPredicate(format: "idExercise == %@", "\(idExercise)")
        
        do {
            let exercises = try context.fetch(fetchRequest)
            
            for exercise in exercises {
                
                exerciseData.append(ExerciseModel(idDifficulty: exercise.value(forKey: "idDifficulty") as! Int, idExercise: exercise.value(forKey: "idExercise") as! Int, listIdSteps: exercise.value(forKey: "listIdSteps") as! [Int], namaExercise: exercise.value(forKey: "namaExercise") as! String, videoUrl: exercise.value(forKey: "videoUrl") as! String, warningData: exercise.value(forKey: "warningData") as! [Int]))
//                print("ijin \(exerciseData.count)")
            }
        } catch {
            
        }
        print("ini exe \(exerciseData.count)")
        return exerciseData
    }
    
    func fetchIdWarning(idExercise : Int) -> [WarningModel] {
        print("masuk\(idExercise)")
        var warningDatas : [WarningModel] = []
        
        let fetchRequest = NSFetchRequest<Exercise>(entityName: "Exercise")
        
        fetchRequest.predicate = NSPredicate(format: "idExercise == %@", "\(idExercise)")
        
        do {
            let results = try context.fetch(fetchRequest)
            print(results)
            for result in results {
                
                print("//masuk")
                let tempWarning : Set<Warning> = result.warning as! Set<Warning>
                let arrTempWarning = Array(tempWarning)
                
                for warning in arrTempWarning {
                    print("ini \(warning.warningText)")
                    
                    warningDatas.append(WarningModel(idWarning: warning.value(forKey: "idWarning") as! Int, warningText: warning.value(forKey: "warningText") as! String))
                }
            }
        } catch  {
            print("error")
        }
        print("ini di function warning \(warningDatas)")
        return warningDatas
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
