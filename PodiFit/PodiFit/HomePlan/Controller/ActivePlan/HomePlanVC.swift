//
//  HomePlanVC.swift
//  PodiFit
//
//  Created by Hafizul Ihsan Fadli on 03/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

let activePlanHelper = ActivePlanModel()

class HomePlanVC: UIViewController {
    
    var plansModel = [PlansModel]()
    
    let activePlanCount = activePlanHelper.fetchActivePlan().count
    
    var namaPlan: String!
    
    var titlePlan: String = ""
    var idPlan: Int!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        print(paths[0])
        setupUI()
        setupDelegate()
        setupRegisterNib()
        setupData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        
        self.tabBarController?.tabBar.isHidden = false
    }
    
    private func setupData() {
        self.plansModel = activePlanHelper.fetchActivePlan()
    }
    
    private func setupDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupRegisterNib() {
        collectionView.register(UINib(nibName: "ActivePlanCell", bundle: nil), forCellWithReuseIdentifier: "ActivePlanCell")
    }
    
    func setupUI() {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addNewPlan" {
            let dest = segue.destination as! UINavigationController
            
            let destVC = dest.topViewController as! PlanOverviewViewController
            
            destVC.checkSender = 1
        }
        
        if segue.identifier == "viewExercisesSegue" {
            let dest = segue.destination as! ShowPlanVC
            
            dest.titlePlan = self.titlePlan
            dest.idPlan = self.idPlan
        }
    }
}


extension HomePlanVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activePlanCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActivePlanCell", for: indexPath) as! ActivePlanCell
        cell.parseData(data: plansModel[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        titlePlan = plansModel[indexPath.row].namaPlan!
        idPlan = Int(plansModel[indexPath.row].idPlan)
        
        performSegue(withIdentifier: "viewExercisesSegue", sender: self)
    }
}
