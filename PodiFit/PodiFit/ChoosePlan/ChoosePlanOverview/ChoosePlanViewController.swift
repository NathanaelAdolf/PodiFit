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

let CustomizePlanHelper = CustomizePlanModel()

class ChoosePlanViewController: UITableViewController, ButtonCellDelegator {

    //var expandableData = [testCellData]()
    
    var exerciseData = [ExerciseModel]()
    var planData = [PlansModel]()
    
    var newExerciseArray = [Int]()
    var newExerciseData = [ExerciseModel]()
    
    var selectedIndexPlan: Int!
    var arrSelectedExercise = [Int]()
    var difficulty = Int()
    
    var selectedJumlahHari = 0

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        //retrieveData()
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
        
        
        self.exerciseData = CustomizePlanHelper.fetchSelectedExercise(idPlan: selectedIndexPlan!)
        self.planData = CustomizePlanHelper.fetchActivePlan()
        self.difficulty = exerciseData[selectedIndexPlan].idDifficulty
        
        //expandableData = [testCellData(title: "Week 1", sectionData: ["Mountain Climber", "Push Up 1", "Push Up 2", "Glute Bridge", "Frog Hold", "One Leg Frog Hold"])]
        
        super.viewDidLoad()
        
        print("selected index Plan = \(selectedIndexPlan!)")
        
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        else if section == 1{
            return 1
        }
        else if section == 2 {
            return 1
        }
        else if section == 4 {
            return 1
        }
        else{
                
            return exerciseData.count
              //return expandableData[section-2].sectionData.count+1
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
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DescTableViewCell.identifier, for: indexPath) as! DescTableViewCell
                cell.parseData(data: planData[selectedIndexPlan-1])
            
            cell.backgroundColor = UIColor.clear
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            return cell
        }
        else if (indexPath.section == 1){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: PlanInfoCell.identifier, for: indexPath) as! PlanInfoCell
            
            if newExerciseData.isEmpty == true {
                cell.parseData(data: planData[selectedIndexPlan-1])
            }
            else{
                cell.tempNewArray = newExerciseArray
                    
                cell.parseData(data: planData[selectedIndexPlan-1])
            }
            
            cell.backgroundColor = UIColor.clear
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            return cell
        }
        else if (indexPath.section == 2) {
                let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseHeaderTableViewCell.identifier, for: indexPath) as! ExerciseHeaderTableViewCell
                cell.backgroundColor = UIColor.clear
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                return cell
        }
        else if (indexPath.section == 4){
            let cell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.identifier, for: indexPath) as! ButtonTableViewCell
            cell.backgroundColor = UIColor.clear
            cell.btnConfirm.layer.borderWidth = 2
            cell.btnConfirm.layer.borderColor = CGColor.init(red: 228/255, green: 246/255, blue: 80/255, alpha: 1)
            cell.delegate = self
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            return cell
        }
        else{
                let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseTableViewCell.identifier, for: indexPath) as! ExerciseTableViewCell
                
                cell.parseData(data: exerciseData[indexPath.row])
                
                //cell.exerciseName.text = expandableData[indexPath.section - 2].sectionData[indexPath.row - 1]
                cell.backgroundColor = UIColor.clear
                cell.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
                return cell
            }
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 120
        }
        else if(indexPath.section == 2){
            return 60
        }
        else if(indexPath.section == 3){
            return 110
        }
        else if(indexPath.section == 0){
            return 85
        }
        else{
            return 125
        }
    }

    
    func retrieveData(){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return}
        
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Difficulty")
        
        do {
            let result = try context.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "levelDifficulty") as! String)
            }
                    
        } catch {
            print("Failed")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "customPlanSegue"{
            let dest = segue.destination as! CustomizePlanTableViewController
            
            dest.selectedIndexPlan = self.selectedIndexPlan
            arrSelectedExercise = planData[selectedIndexPlan-1].chosenExercise!
            
            dest.selectedDifficulty = self.difficulty
            
            if newExerciseArray.isEmpty{
                dest.arrSelectedExercise = self.arrSelectedExercise
            }
            else{
                dest.arrSelectedExercise = newExerciseArray
            }
        }
    }
    
    func callSegueFromCell() {
        
        self.performSegue(withIdentifier: "customPlanSegue", sender: self )
            
     }
    
    func callSegueFromCellToMain() {
//        self.preSegue(withIdentifier: "mainSegue", sender: self )
        
        if (newExerciseArray.isEmpty && planData[selectedIndexPlan-1].idDifficulty == 1) {
            var planindex = CustomizePlanHelper.fetchIdPlan()
            planindex?.append(1)
            CustomizePlanHelper.updateUserPlan(userId: 0, plan: planindex!)
            
            print("inserted plan id = 1")
        }
        else if (newExerciseArray.isEmpty && planData[selectedIndexPlan-1].idDifficulty == 2){
            var planindex = CustomizePlanHelper.fetchIdPlan()
            planindex?.append(2)
            CustomizePlanHelper.updateUserPlan(userId: 0, plan: planindex!)
            
            print("inserted plan id = 2")
        }
        else{
            insertNewPlan()
            
            let lastIndex = CustomizePlanHelper.checkPlanIndex()
            
            var currentPlanIndex = CustomizePlanHelper.fetchIdPlan()
            currentPlanIndex?.append(lastIndex)
            
            CustomizePlanHelper.updateUserPlan(userId: 0, plan: currentPlanIndex!)
            print("data inserted, index \(lastIndex)")
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() else {
            return
        }
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
    
    func insertNewPlan() {
        var index = (CustomizePlanHelper.checkPlanIndex() + 1)
        
        let iddiff: Int = Int(planData[selectedIndexPlan-1].idDifficulty)
        let durasiplan: Int = Int(planData[selectedIndexPlan-1].durasiPlan)
        let sessionday: Int = Int(planData[selectedIndexPlan-1].durasiSessionDay)
        let jumlahhari: Int = Int(planData[selectedIndexPlan-1].jumlahHari)
        
        CustomizePlanHelper.storeCustomPlanData(idPlan: index, namaPlan: planData[selectedIndexPlan-1].namaPlan!, idDifficulty: iddiff, durasiPlan: durasiplan, durasiSessionDay: sessionday, jumlahHari: jumlahhari, totalSessionDone: 0, choosenExercise: newExerciseArray, isPlanDone: false, description: planData[selectedIndexPlan-1].desc!)
    }
    
    @IBAction func unwindToCustomizePlan(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as! CustomizePlanTableViewController
        // Use data from the view controller which initiated the unwind segue
        newExerciseArray = sourceViewController.tempSelectedExercise
        
        print("new exercise array = \(newExerciseArray)")
        
        if newExerciseData.isEmpty == false{
            newExerciseData = []
        }
        
        for i in 0...(newExerciseArray.count - 1){
            //print("exerciseArray: \(i)")
            let tempExercise = CustomizePlanHelper.getExercise(idExercise: newExerciseArray[i])!
            
            newExerciseData.append(tempExercise)
        }
        print("new exercise array = \(newExerciseData.count)")
        print("id diff = \(planData[selectedIndexPlan-1].idDifficulty)")
        
        exerciseData = newExerciseData
        
        tableView.reloadData()
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
