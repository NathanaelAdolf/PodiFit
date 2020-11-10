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
    
    func storeToUserData(idUser: Int,userName: String,idPlan: [Int]?,height: Int,weight: Int,img: Data)
    {
      
          guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return}
    
          let context = appDelegate.persistentContainer.viewContext

          let dataOfEntity = NSEntityDescription.entity(forEntityName: "User", in: context)!
          let listOfEntity = NSManagedObject(entity: dataOfEntity, insertInto: context)

         listOfEntity.setValue(idUser, forKey: "idUser")
        listOfEntity.setValue(userName, forKey: "userName")
        listOfEntity.setValue(idPlan, forKey: "userIdPlan")
        listOfEntity.setValue(height, forKey: "height")
        listOfEntity.setValue(weight, forKey: "weight")
        listOfEntity.setValue(img, forKey: "img")
  
          do {
              
             try context.save()
            
          } catch let error as NSError {
             
              print("Gagal save context \(error), \(error.userInfo)")
          }
    
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
                        print("img : \(data.value(forKey: "img")as! Data)")
                        print("\n")
                        
                        tempUserData.append(UserDataModel(Name: data.value(forKey: "userName")as! String,userIdPlan: data.value(forKey: "userIdPlan")as! [Int]?, weight: data.value(forKey: "weight")as! Int, height: data.value(forKey: "height")as! Int,img: data.value(forKey: "img")as! Data))
                        
                    }
              }
             catch
             {
                 print("Failed")
             }
        
        return tempUserData
    }
    
    func isUserTableEmpty()->Bool
    {
        
        var counter: Int = 0
        var isTableEmpty = Bool()
        
        guard let appDel = UIApplication.shared.delegate as? AppDelegate else { return isTableEmpty}
                 let context = appDel.persistentContainer.viewContext
            
                 let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
             
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
    
    func updateUserImage(nameToUpdate: String, image: Data)
    {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "userName = %@", nameToUpdate)
        
        do{
            let fetch = try managedContext.fetch(fetchRequest)
            let dataToUpdate = fetch[0] as! NSManagedObject
        
            dataToUpdate.setValue(image, forKey: "img")
         
          
            try managedContext.save()
        }catch let err{
            print(err)
        }

    }
    
    func deleteDataInUser(uniqueUserName: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "userName = %@", uniqueUserName)
        
        do{
            let dataToDelete = try managedContext.fetch(fetchRequest)[0] as! NSManagedObject
            managedContext.delete(dataToDelete)
            
            try managedContext.save()
        }catch let err{
            print(err)
        }
    }

}
