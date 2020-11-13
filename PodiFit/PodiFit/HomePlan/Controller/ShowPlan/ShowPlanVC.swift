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
    
    let countWeek = activePlanHelper.countWeekPlan(idPlan: 1)
    
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
        var title: String = ""
        let data = activePlanHelper.fetchActivePlan()
        data.forEach { (active) in
            title = active.namaPlan.unsafelyUnwrapped
        }
        
        if let target = segue.destination as? ListPlanVC {
            target.titlePlan = titlePlan
        }
    }
}

extension ShowPlanVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countWeek
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewUI.dequeueReusableCell(withIdentifier: NumberExercisesCell.identifier, for: indexPath) as! NumberExercisesCell
        cell.delegate = self
        
        return cell
    }
    
}

extension ShowPlanVC: ShowPlanDelegator {
    func callSegueFromColViewCell() {
        performSegue(withIdentifier: "exerciseListSegue", sender: self)
    }
}
