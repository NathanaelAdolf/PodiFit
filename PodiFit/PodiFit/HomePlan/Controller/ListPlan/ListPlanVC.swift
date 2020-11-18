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
    
    var exerciseCount: Int!

    var desc: String!
    var level: String!
    var duration: String!
    var exercise: String!
   
    @IBOutlet weak var tableViewUI: UITableView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var exerciseLabel: UILabel!
    
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
        self.exerciseCount = activePlanHelper.fetchSelectedExercise(idPlan: idPlan).count
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
        
        descLabel.text = desc
        levelLabel.text = level
        durationLabel.text = "\(duration!) second"
        exerciseLabel.text = "\(exercise!) moves"
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
