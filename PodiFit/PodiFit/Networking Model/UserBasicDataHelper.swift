//
//  UserBasicDataHelper.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 02/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit
import CoreData

class UserBasicDataHelper: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func storeToUserData(idUser: Int,userName: String,idPlan: [Int]?,height: Int,weight: Int)->String
    {
      
          guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return ""}
    
          var message: String = ""

          let context = appDelegate.persistentContainer.viewContext

          let dataOfEntity = NSEntityDescription.entity(forEntityName: "User", in: context)!
          let listOfEntity = NSManagedObject(entity: dataOfEntity, insertInto: context)

         listOfEntity.setValue(idUser, forKey: "idUser")
        listOfEntity.setValue(userName, forKey: "userName")
        listOfEntity.setValue(idPlan, forKey: "userIdPlan")
        listOfEntity.setValue(height, forKey: "height")
        listOfEntity.setValue(weight, forKey: "weight")
  
          do {
              
             try context.save()
              message = "00"
          } catch let error as NSError {
             
              print("Gagal save context \(error), \(error.userInfo)")
              message = "01"
          }
        
        return message
    }
    
    func retrieveUserBasicData()->[UserDataModel]
    {
        
        var tempUserData = [UserDataModel]()
        
        guard let appDel = UIApplication.shared.delegate as? AppDelegate else { return tempUserData }
                 let context = appDel.persistentContainer.viewContext
            
                 let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
             
             do {
                    let result = try context.fetch(fetch)
                    for data in result as! [NSManagedObject]
                     {
                        print("id User : \(data.value(forKey: "idUser")as! Int)")
                        print("user name : \(data.value(forKey: "userName")as! String)")
                        print("id plan : \(data.value(forKey: "userIdPlan")as! [Int]?)")
                        print("height : \(data.value(forKey: "height")as! Int)")
                        print("weight : \(data.value(forKey: "weight")as! Int)")
                        print("\n")
                        
                        tempUserData.append(UserDataModel(Name: data.value(forKey: "userName")as! String, weight: data.value(forKey: "weight")as! Int, height: data.value(forKey: "height")as! Int))
                        
                    }
              }
             catch
             {
                 print("Failed")
             }
        
        return tempUserData
    }
    
    func updateUserData(userNameToUpdate: String,newName: String,height: Int,weight: Int) -> String {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return "" }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "userName = %@", userNameToUpdate)
        
        do{
            let fetch = try managedContext.fetch(fetchRequest)
            let dataToUpdate = fetch[0] as! NSManagedObject
        
            dataToUpdate.setValue(newName, forKey: "userName")
            dataToUpdate.setValue(height, forKey: "height")
            dataToUpdate.setValue(weight, forKey: "weight")
          
            try managedContext.save()
        }catch let err{
            print(err)
        }
        
        return "00"
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
