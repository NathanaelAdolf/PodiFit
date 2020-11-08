//
//  DetailBadgesViewController.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 01/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class DetailBadgesViewController: UIViewController,UITableViewDataSource, UITableViewDelegate

{
    
    @IBOutlet var detailBadgesTableView: UITableView!
    
    var detailBadgeData = [DetailBadgesModel]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        detailBadgeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailBadgesCell", for: indexPath) as! DetailBadgeTableViewCell
        
        cell.badgeImage.image = UIImage(named: detailBadgeData[indexPath.row].imageName)
        cell.badgeTitle.text = detailBadgeData[indexPath.row].detailBadgeTitle
        cell.badgeDescription.text = detailBadgeData[indexPath.row].detailBadgeDescription
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailBadgesTableView.delegate = self
        detailBadgesTableView.dataSource = self
        
        self.view.backgroundColor = Colors.backgroundBaseColor
        
        notifHelper.configureUserNotificationCenter()
        
            //data dummy buat detail badge
        self.detailBadgeData =
        [
            DetailBadgesModel(imageName: "completed one plan badge.png", title: "1st Time", description: "You have finished your first exercise"),
            DetailBadgesModel(imageName: "custom exercise badge.png", title: "Custom Exercise", description: "7 days in a row. Well done!"),
            DetailBadgesModel(imageName: "exercise addict badge.png", title: "Exercise Addict", description: "7 days in a row. Well done!"),
            DetailBadgesModel(imageName: "exercise master badge.png", title: "Exercise Master", description: "7 days in a row. Well done!"),
            DetailBadgesModel(imageName: "completed one plan badge.png", title: " Completed One Plan", description: "YYou have finished your first exercise")
        ]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        .lightContent
    }
    
    
}
