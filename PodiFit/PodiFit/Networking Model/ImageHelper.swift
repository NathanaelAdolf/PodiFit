//
//  ImageHelper.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 07/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit
import CoreData

class ImageHelper {
    
    static let shareInstance = ImageHelper()
        
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveImage(data: Data,nameToUpdate: String)
    {
        let imageInstance = User(context: context)
        imageInstance.img = data

        do {
            updateUserData(imageToUpdate: data, userName: nameToUpdate)
        print("Image is saved")
        } catch {
        print(error.localizedDescription)
              }
        
        
    }
    
    func updateUserData(imageToUpdate: Data,userName: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "userName = %@", userName)
        
        do{
            let fetch = try managedContext.fetch(fetchRequest)
            let dataToUpdate = fetch[0] as! NSManagedObject
        
            dataToUpdate.setValue(imageToUpdate, forKey: "img")
   
            try managedContext.save()
        }catch let err{
            print(err)
        }
        
    }
    
    
}
