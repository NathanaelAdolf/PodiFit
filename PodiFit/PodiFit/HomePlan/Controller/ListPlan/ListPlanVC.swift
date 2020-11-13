//
//  ListPlanVC.swift
//  PodiFit
//
//  Created by Hafizul Ihsan Fadli on 09/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class ListPlanVC: UIViewController {
    
    var exercisesModel = [ExerciseModel]()
    
    let exerciseCount = activePlanHelper.fetchSelectedExercise(idPlan: 1).count

   
    @IBOutlet weak var tableViewUI: UITableView!
    
    var titlePlan: String!
    var idPlan: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupData()
        setupDelegate()
        setupRegisterNib()
    }
    
    private func setupData() {
        self.exercisesModel = activePlanHelper.fetchSelectedExercise(idPlan: idPlan)
    }
    
    private func setupDelegate() {
        tableViewUI.delegate = self
        tableViewUI.dataSource = self
    }
    
    private func setupRegisterNib() {
        tableViewUI.register(UINib(nibName: "ListExerciseCell", bundle: nil), forCellReuseIdentifier: "ListExerciseCell")
    }
    
    private func setupUI() {
        self.navigationItem.title = titlePlan
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let target = segue.destination as? ExerciseViewController {
            target.idPlanActive = self.idPlan
        }
    }

}

extension ListPlanVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exerciseCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewUI.dequeueReusableCell(withIdentifier: "ListExerciseCell", for: indexPath) as! ListExerciseCell
        cell.parseData(data: exercisesModel[indexPath.row])
        
        return cell
    }
    
    
}
