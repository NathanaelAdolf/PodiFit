//
//  CustomizePlanTableViewController.swift
//  PodiFit
//
//  Created by Griffin on 23/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

protocol UnwindDelegator {
    func unwindSegueFromCell()
    func showAlert()
}

class CustomizePlanTableViewController: UITableViewController, UnwindDelegator{
    
    var allExercise = [ExerciseModel]()
    var arrSelectedExercise = [Int]()
    var tempSelectedExercise: [Int] = []
    var selectedDifficulty = Int()
    var selectedIndexPlan: Int!
    
    var model = [MovementModel]()
    var selectedExercise = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem()
        
        backButton.title = ""
        backButton.image = UIImage(named: "chevron.left")
        backButton.tintColor = Colors.yellowColor
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "plan_bg"), for: .default)
        
        self.tabBarController?.tabBar.isHidden = true
        
        //self.tableView.backgroundColor = UIColor.init(patternImage: UIImage(named: "plan_bg")!)
        self.tableView.backgroundColor = UIColor.clear
        self.view.backgroundColor = UIColor.init(patternImage: UIImage(named: "plan_bg")!)
        //notifHelper.configureUserNotificationCenter()
        
        allExercise = CustomizePlanHelper.fetchExerciseByIdDifficulty(idDifficulty: selectedDifficulty)!
        print("allex = \(allExercise.count)")
        print("arrSE = \(arrSelectedExercise)")
        tempSelectedExercise = arrSelectedExercise
        
        tableView.register(CustomizePlanTableViewCell.nib(), forCellReuseIdentifier: CustomizePlanTableViewCell.identifier)
        
        tableView.register(FinishButtonTableViewCell.nib(), forCellReuseIdentifier: FinishButtonTableViewCell.identifier)

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    /*
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
   */

    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
            if let header = view as? UITableViewHeaderFooterView {
                //header.backgroundView?.backgroundColor = UIColor.green
                header.tintColor = UIColor.clear
                header.textLabel?.textColor = UIColor.white
                header.textLabel?.font = UIFont(name: "SF Pro", size: 18)
            }
        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomizePlanTableViewCell.identifier, for: indexPath) as! CustomizePlanTableViewCell

            // Configure the cell...
            cell.colView = self
            cell.backgroundColor = UIColor.clear
            cell.selectedIndexPlan = selectedIndexPlan
            cell.arraySelectedExercise = arrSelectedExercise
            cell.tempSelectedExercise = tempSelectedExercise
            //cell.configure(with: model)
            cell.parseData(data: allExercise)
            
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: FinishButtonTableViewCell.identifier, for: indexPath) as! FinishButtonTableViewCell
            
            cell.delegate = self
            cell.backgroundColor = UIColor.clear
            return cell
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 700
        }
        else {
            return 70
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "modalPlanSegue" {
            
            var storyboard = UIStoryboard(name: "ChoosePlan", bundle: nil)
            let pvc = storyboard.instantiateViewController(withIdentifier: "ModalPlanViewController") as! ModalPlanViewController

            pvc.modalPresentationStyle = UIModalPresentationStyle.popover
            pvc.transitioningDelegate = self
            
            
            
//
//            destination.tempStep = planModelHelpers.fetchIdSteps(idExercise: tempExerciseDetail[0].idExercise)
//            destination.tempExerciseDetail = planModelHelpers.fetchExerciseDetail(idExercise: tempExerciseDetail[0].idExercise)
            
            self.present(pvc, animated: true, completion: nil)
        }
        else if segue.identifier == "unwindToOverview" {
            print("prepare dlu")
            selectedExercise = checkSelected
            tempSelectedExercise = newSelectedExercise
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

extension CustomizePlanTableViewController: UIViewControllerTransitioningDelegate{
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        return HalfSizePresentationController(presentedViewController: presented, presenting: presentingViewController)
    }
}

extension CustomizePlanTableViewController: CollectionCellDelegator{
    func presentFromButton(id: Int) {
        var storyboard = UIStoryboard(name: "ChoosePlan", bundle: nil)
        let pvc = storyboard.instantiateViewController(withIdentifier: "ModalPlanViewController") as! ModalPlanViewController

        pvc.modalPresentationStyle = UIModalPresentationStyle.popover
        pvc.transitioningDelegate = self
        pvc.idMovement = id

        self.present(pvc, animated: true, completion: nil)
    }
    
    func unwindSegueFromCell() {
        self.performSegue(withIdentifier: "unwindToOverview", sender: self )
        
     }
    
    func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Please select at least 5 exercises for your plan", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

class HalfSizePresentationController : UIPresentationController {
    
    override var frameOfPresentedViewInContainerView: CGRect{
        return CGRect(x: 0, y: (containerView?.bounds.height)!/2, width: containerView!.bounds.width, height: containerView!.bounds.height/2)
    }
}
