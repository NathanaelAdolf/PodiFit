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
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        var title: String = ""
        let data = activePlanHelper.fetchActivePlan()
        data.forEach { (active) in
            title = active.namaPlan.unsafelyUnwrapped
        }
        
        if let target = segue.destination as? ShowPlanVC {
            target.titlePlan = title
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
            //if let cell = collectionView.cellForItem(at: indexPath) as? MovementCollectionViewCell{}
            //print(collectionView.cellForItem(at: indexPath))
            performSegue(withIdentifier: "viewExercisesSegue", sender: self)
        }
    }
