//
//  ShowPlanVC.swift
//  PodiFit
//
//  Created by Hafizul Ihsan Fadli on 07/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

protocol ShowPlanDelegator {
    func callSegueFromColViewCell()
}

class ShowPlanVC: UIViewController {
    
    var titlePlan: String = ""
    var idPlan: Int!
    var day: [Int]!
    var weekArr = [1, 2, 3, 4]
    
    @IBOutlet weak var tableViewUI: UITableView!
    @IBOutlet weak var progressExercise: UIProgressView!
    @IBOutlet weak var progressExerciseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupRegisterNib()
        setupDelegate()
        setupData()
    }
    
    private func setupDelegate() {
        tableViewUI.delegate = self
        tableViewUI.dataSource = self
    }
    
    private func setupRegisterNib() {
        tableViewUI.register(NumberExercisesCell.nib(), forCellReuseIdentifier: NumberExercisesCell.identifier)
    }
    
    func setupData() {
        self.day = activePlanHelper.countDayPlan(idPlan: idPlan)
    }
    
    func setupUI() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationItem.title = titlePlan
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let target = segue.destination as? ListPlanVC {
            target.titlePlan = self.titlePlan
            target.idPlan = self.idPlan
        }
        if let target = segue.destination as? ExerciseViewController {
            target.idPlanActive = self.idPlan
        }
    }
}

extension ShowPlanVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activePlanHelper.countWeekPlan(idPlan: idPlan)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewUI.dequeueReusableCell(withIdentifier: NumberExercisesCell.identifier, for: indexPath) as! NumberExercisesCell
        cell.delegate = self
        
        cell.day = self.day
        cell.weekLabel.text = "Week \(weekArr[indexPath.row]) Exercise"
        
        return cell
    }
    
}

extension ShowPlanVC: ShowPlanDelegator {
    func callSegueFromColViewCell() {
        performSegue(withIdentifier: "exerciseListSegue", sender: self)
    }
}
