//
//  HomeProfileViewController.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 22/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class HomeProfileViewController: UIViewController {

    @IBOutlet weak var completeRemindBadgeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
      //  completeRemindBadgeTableView.delegate = self
       // completeRemindBadgeTableView.dataSource = self
    }
    

  
    

}

/*extension HomeProfileViewController: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
    }
    
    
}*/


