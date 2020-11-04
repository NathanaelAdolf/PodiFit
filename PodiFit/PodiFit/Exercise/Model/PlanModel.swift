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
    
    func fetchExerciseById() -> [ExerciseModel] {
        var tempExerciseData = [ExerciseModel]()
        
        // reference to moc with return
        guard let appDel = UIApplication.shared.delegate as? AppDelegate else { return tempExerciseData}
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Exercise")
        
        do {
            let result = try context.fetch(fetch)
            for data in result as! [NSManagedObject]{
                
                
                tempExerciseData.append(ExerciseModel(idDifficulty: data.value(forKey: "idDifficulty") as! Int, idExercise: data.value(forKey: "idExercise") as! Int, listIdSteps: data.value(forKey: "listIdSteps")as! [Int], namaExercise: data.value(forKey: "namaExercise")as! String, videoUrl: data.value(forKey: "videoUrl")as! String, warningData: data.value(forKey: "warningData")as! Int))
            }
        } catch {
            
        }
        
        
        
        return tempExerciseData
    }
    
    func createPlan () {
        // save the data
        do {
            try self.context.save()
        }
        catch {
            
        }
        
        // re-fetch
        self.fetchPlan()
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
