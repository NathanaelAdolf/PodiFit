//
//  ChoosePlanViewController.swift
//  PodiFit
//
//  Created by Griffin on 22/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class ChoosePlanViewController: UITableViewController {

    var sections = ["Title", "Plan", "Button"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(DescTableViewCell.nib(), forCellReuseIdentifier: DescTableViewCell.identifier)
        
        tableView.register(ExerciseTableViewCell.nib(), forCellReuseIdentifier: ExerciseTableViewCell.identifier)
        
        tableView.register(ButtonTableViewCell.nib(), forCellReuseIdentifier: ButtonTableViewCell.identifier)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell1")
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Header"
        
        return label
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        
        cell.textLabel?.text = "tes"
        
        return cell
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
