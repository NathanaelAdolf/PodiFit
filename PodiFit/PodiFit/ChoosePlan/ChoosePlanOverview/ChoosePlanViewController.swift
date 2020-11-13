//
//  ChoosePlanViewController.swift
//  PodiFit
//
//  Created by Griffin on 22/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit
import CoreData

struct testCellData{
    var title = String ()
    var sectionData = [String]()
}

protocol ButtonCellDelegator {
    func callSegueFromCell()
    func callSegueFromCellToMain()
}

class ChoosePlanViewController: UITableViewController, ButtonCellDelegator {

    var expandableData = [testCellData]()
    var selectedExercise = 0

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        
        let backButton = UIBarButtonItem()
        
        backButton.title = ""
        backButton.image = UIImage(named: "chevron.left")
        backButton.tintColor = Colors.yellowColor
//        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(named: "plan_bg"), for: .default)
        self.tableView.backgroundColor = UIColor.clear
        self.view.backgroundColor = UIColor.init(patternImage: UIImage(named: "plan_bg")!)
        self.navigationController?.navigationBar.isHidden = false
        
        expandableData = [testCellData(title: "Week 1", sectionData: ["Mountain Climber", "Push Up 1", "Push Up 2", "Glute Bridge", "Frog Hold", "One Leg Frog Hold"])]
        
        super.viewDidLoad()
        print("selected exercise = \(selectedExercise)")
        //notifHelper.configureUserNotificationCenter()
        
        tableView.register(DescTableViewCell.nib(), forCellReuseIdentifier: DescTableViewCell.identifier)
        
        tableView.register(ExerciseTableViewCell.nib(), forCellReuseIdentifier: ExerciseTableViewCell.identifier)
        
        tableView.register(ButtonTableViewCell.nib(), forCellReuseIdentifier: ButtonTableViewCell.identifier)
        
        tableView.register(ExerciseHeaderTableViewCell.nib(), forCellReuseIdentifier: ExerciseHeaderTableViewCell.identifier)
        
        tableView.register(PlanInfoCell.nib(), forCellReuseIdentifier: PlanInfoCell.identifier)
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.separatorColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    
    func fetchData(){
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        else if section == 1{
            return 1
        }
        else if section == (expandableData.count + 2) {
            return 1
        }
        else{
            //print("section: \(section)")
              //print("expdata count: \(expandableData[section-2].sectionData.count+1)")
                
              return expandableData[section-2].sectionData.count+1
        }
    }
    /*
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Header"
        
        return label
    }
    */
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return (expandableData.count + 3)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DescTableViewCell.identifier, for: indexPath) as! DescTableViewCell
            cell.planDesc.text = "Action Plan designed for your easy leg stuff"
            cell.backgroundColor = UIColor.clear
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            return cell
        }
        else if (indexPath.section == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: PlanInfoCell.identifier, for: indexPath) as! PlanInfoCell
            cell.backgroundColor = UIColor.clear
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            return cell
        }
        else if (indexPath.section == (expandableData.count + 2)){
            let cell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.identifier, for: indexPath) as! ButtonTableViewCell
            cell.backgroundColor = UIColor.clear
            cell.btnConfirm.layer.borderWidth = 2
            cell.btnConfirm.layer.borderColor = CGColor.init(red: 228/255, green: 246/255, blue: 80/255, alpha: 1)
            cell.delegate = self
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            return cell
        }
        else{
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseHeaderTableViewCell.identifier, for: indexPath) as! ExerciseHeaderTableViewCell
                cell.backgroundColor = UIColor.clear
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                return cell
            }
            else{
                let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseTableViewCell.identifier, for: indexPath) as! ExerciseTableViewCell
                cell.exerciseName.text = expandableData[indexPath.section - 2].sectionData[indexPath.row - 1]
                cell.backgroundColor = UIColor.clear
                cell.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
                return cell
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 120
        }
        else if(indexPath.section == (expandableData.count + 1) && indexPath.row == 0){
            return 60
        }
        else if(indexPath.section == (expandableData.count + 1) && indexPath.row != 0){
            return 110
        }
        else if(indexPath.section == 0){
            return 85
        }
        else{
            return 125
        }
    }
    
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("sct=\(indexPath.section) ,idx =\(indexPath.row)")
        
        //performSegue(withIdentifier: "customPlanSegue", sender: self)
        
        
        if (indexPath.section > 1 && indexPath.section < (expandableData.count + 2) && indexPath.row == 0){
            if expandableData[indexPath.section-2].opened == true{
                expandableData[indexPath.section-2].opened = false
                //print("sct=\(indexPath.section) ,idx =\(indexPath.row), masuk if")
            }else{
                expandableData[indexPath.section-2].opened = true
                
                //print("sct=\(indexPath.section) ,idx =\(indexPath.row), masuk else")
            }
            
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
            //tableView.reloadData()
        }else if (indexPath.section == (expandableData.count + 2)){
            //performSegue(withIdentifier: "customPlanSegue", sender: self)
        }else if (indexPath.section != 1){
            
        }
        
    }
 */
    
    func retrieveData(){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return}
        
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Plan")
        let fetchRequest2 = NSFetchRequest<NSFetchRequestResult>(entityName: "Exercise")
        
        do {
            let result = try context.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                //print(data.value(forKey: "planname") as!
            }
                    
        } catch {
            print("Failed")
        }
        
    }
    
    func callSegueFromCell() {
        self.performSegue(withIdentifier: "customPlanSegue", sender: self )

     }
    
    func callSegueFromCellToMain() {
//        self.preSegue(withIdentifier: "mainSegue", sender: self )
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() else {
            return
        }
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
    
    
    @IBAction func unwindToCustomizePlan(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as! CustomizePlanTableViewController
        // Use data from the view controller which initiated the unwind segue
        selectedExercise = sourceViewController.selectedExercise
        
        print("selected exercise unwind = \(selectedExercise)")
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
