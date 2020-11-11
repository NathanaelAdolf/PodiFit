//
//  ShowPlanVC.swift
//  PodiFit
//
//  Created by Hafizul Ihsan Fadli on 07/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class ShowPlanVC: UIViewController {

    @IBOutlet weak var tableViewUI: UITableView!
    
    @IBAction func btnTestStart(_ sender: Any) {
        performSegue(withIdentifier: "exerciseListSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupRegisterNib()
        setupDelegate()
    }
    
    private func setupDelegate() {
        tableViewUI.delegate = self
        tableViewUI.dataSource = self
    }
    
    private func setupRegisterNib() {
        tableViewUI.register(NumberExercisesCell.nib(), forCellReuseIdentifier: NumberExercisesCell.identifier)
    }
    
    func setupUI() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationItem.title = "Leg yeaahhh"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        
        self.tabBarController?.tabBar.isHidden = true
    }

}

extension ShowPlanVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewUI.dequeueReusableCell(withIdentifier: NumberExercisesCell.identifier, for: indexPath) as! NumberExercisesCell
        
        cell.colView = self
        
        return cell
    }
    
}
