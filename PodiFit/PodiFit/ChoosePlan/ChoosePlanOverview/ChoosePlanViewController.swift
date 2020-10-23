//
//  ChoosePlanViewController.swift
//  PodiFit
//
//  Created by Griffin on 22/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

struct testCellData{
    var opened = Bool()
    var title = String ()
    var sectionData = [String]()
}

class ChoosePlanViewController: UITableViewController {

    var expandableData = [testCellData]()
    
    
    override func viewDidLoad() {
        expandableData = [testCellData(opened: false, title: "Week 1", sectionData: ["Push Up 1",                      "Push Up 2"]),
                          testCellData(opened: false, title: "Week 2", sectionData: ["Push Up 1", "Push Up 2"]),
                          testCellData(opened: false, title: "Week 3", sectionData: ["Push Up 1", "Push Up 2"])]
        
        super.viewDidLoad()

        tableView.register(DescTableViewCell.nib(), forCellReuseIdentifier: DescTableViewCell.identifier)
        
        tableView.register(ExerciseTableViewCell.nib(), forCellReuseIdentifier: ExerciseTableViewCell.identifier)
        
        tableView.register(ButtonTableViewCell.nib(), forCellReuseIdentifier: ButtonTableViewCell.identifier)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell1")
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if expandableData[section].opened == true {
            return expandableData[section].sectionData.count + 1
        }
        else{
            return 1
        }
        
        //return 10
    }
    /*
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Header"
        
        return label
    }
    */
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return expandableData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            //let cell = tableView.dequeueReusableCell(withIdentifier: DescTableViewCell.identifier, for: indexPath)
            //cell.textLabel?.text = "Action plan"
            let cell = tableView.dequeueReusableCell(withIdentifier: DescTableViewCell.identifier, for: indexPath)
            cell.textLabel?.text = expandableData[indexPath.section].title
            
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseTableViewCell.identifier, for: indexPath)
            cell.textLabel?.text = expandableData[indexPath.section].sectionData[indexPath.row - 1]
            return cell
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if expandableData[indexPath.section].opened == true{
            expandableData[indexPath.section].opened = false
        }else{
            expandableData[indexPath.section].opened = true
            
            //print(indexPath)
        }
        
        let sections = IndexSet.init(integer: indexPath.section)
        tableView.reloadSections(sections, with: .none)
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
