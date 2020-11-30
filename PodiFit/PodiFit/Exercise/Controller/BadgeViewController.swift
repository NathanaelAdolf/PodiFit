//
//  BadgeViewController.swift
//  PodiFit
//
//  Created by Muhamad Vicky on 04/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class BadgeViewController: UIViewController {
    
    @IBOutlet weak var badgeView : BadgeView!
    var namaGambar: String!
    var namaBadges: String!
    var informationBadges: String!
    
    var status : Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        AppUtility.lockOrientation(.portrait)
//        badgeView.setupBadgeView()
        badgesShouldShow()
        
        print("ini di badge \(status)")
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func claimBadge(_ sender: Any) {
//        self.performSegue(withIdentifier: "toReview", sender: nil)
    }

    func badgesShouldShow() {
        switch status {
        case 1:
            namaGambar = "first time badge"
            namaBadges = "1st Time Exercise"
            informationBadges = "Finish exercise for the first time"
            badgeView.setupBadgeView(namaGambar: namaGambar, namaBadges: namaBadges, informationBadges: informationBadges)
        case 2:
        
            namaGambar = "completed one plan badge"
            namaBadges = "Completed One Plan"
            informationBadges = "Completed one exercise plan"
            badgeView.setupBadgeView(namaGambar: namaGambar, namaBadges: namaBadges, informationBadges: informationBadges)
        default:
            "Sorry"
        }
        
    }

}
