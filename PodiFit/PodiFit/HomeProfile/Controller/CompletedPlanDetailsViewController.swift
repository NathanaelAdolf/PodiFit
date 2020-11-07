//
//  CompletedPlanDetailsViewController.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 30/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class CompletedPlanDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var planDetailsData = [CompletedPlanDetailModel]()
    
    var tempPlanData = [CompletedPlanModel]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        planDetailsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "completedPlanDetailCell")as! CompletedPlanDetailTableViewCell
        
        cell.titlePlanLabel.text = planDetailsData[indexPath.row].titleMovement
        cell.numberWeeksLabel.text = String(planDetailsData[indexPath.row].numberWeeks)
        cell.numberExerciseLabel.text = String(planDetailsData[indexPath.row].numberExercise)
        cell.planImage.image = UIImage(named: planDetailsData[indexPath.row].imagePlan)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    

    @IBOutlet var completedPlanDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        completedPlanDetailTableView.delegate = self
        completedPlanDetailTableView.dataSource = self
        
        self.view.backgroundColor = Colors.backgroundBaseColor
        
        notifHelper.configureUserNotificationCenter()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if tempPlanData.count != 0 {
            
            for i in 0...tempPlanData.count - 1
            {
                planDetailsData.append(CompletedPlanDetailModel(titleMovement: tempPlanData[i].titleMovement, numberWeeks: tempPlanData[i].period, numberExercise: 10, imagePlan: "LegPlanImage.png"))
            }
        }
       
        
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        .lightContent
    }

}
