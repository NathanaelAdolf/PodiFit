//
//  CustomizePlanTableViewController.swift
//  PodiFit
//
//  Created by Griffin on 23/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit



class CustomizePlanTableViewController: UITableViewController{

    var model = [MovementModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem()
        
        backButton.title = ""
        backButton.image = UIImage(named: "chevron.left")
        backButton.tintColor = Colors.yellowColor
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(named: "plan_bg"), for: .default)
        //self.navigationController?.navigationBar.titleTextAttrib
        
        //self.tableView.backgroundColor = UIColor.init(patternImage: UIImage(named: "plan_bg")!)
        self.tableView.backgroundColor = UIColor.clear
        self.view.backgroundColor = UIColor.init(patternImage: UIImage(named: "plan_bg")!)
        //notifHelper.configureUserNotificationCenter()

        model.append(MovementModel(movementName: "Step Up", movementImage: "1", movementDetail: "20x"))
        
        model.append(MovementModel(movementName: "Glute Bridge", movementImage: "2", movementDetail: "20x"))
        
        model.append(MovementModel(movementName: "Kneeling Squat", movementImage: "3", movementDetail: "20x"))
        
        model.append(MovementModel(movementName: "Frog Hold", movementImage: "1", movementDetail: "20x"))
        
        model.append(MovementModel(movementName: "Frog Hold 2", movementImage: "2", movementDetail: "20x"))
        
        tableView.register(CustomizePlanTableViewCell.nib(), forCellReuseIdentifier: CustomizePlanTableViewCell.identifier)
        
        //print(model)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionName: String
            switch section {
                case 0:
                    sectionName = "Lunges"
                case 1:
                    sectionName = "Squat"
                case 2:
                    sectionName = "Hamstring"
                default:
                    sectionName = ""
            }
            return sectionName
    }

    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
            if let header = view as? UITableViewHeaderFooterView {
                //header.backgroundView?.backgroundColor = UIColor.green
                header.tintColor = UIColor.clear
                header.textLabel?.textColor = UIColor.white
                header.textLabel?.font = UIFont(name: "SF Pro", size: 18)
            }
        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomizePlanTableViewCell.identifier, for: indexPath) as! CustomizePlanTableViewCell

        // Configure the cell...
        cell.colView = self
        cell.backgroundColor = UIColor.clear
        cell.configure(with: model)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "modalPlanSegue" {
            let dest = segue.destination as! ModalPlanViewController
            
            dest.exerciseName?.text = "Mountain Climber"
        }
        
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
