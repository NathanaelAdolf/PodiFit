//
//  BadgeView.swift
//  PodiFit
//
//  Created by Muhamad Vicky on 04/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class BadgeView: UIView {

    @IBOutlet weak var viewPopUp: UIView!
    @IBOutlet weak var imageBadges: UIImageView!
    @IBOutlet weak var nameBadgesLbl: UILabel!
    @IBOutlet weak var informationBadgesLbl: UILabel!
    
    
    
    func setupBadgeView(namaGambar: String, namaBadges: String, informationBadges : String){
        viewPopUp.layer.cornerRadius = 10
        print("ini gambar \(namaGambar)")
        nameBadgesLbl.text = namaBadges
        informationBadgesLbl.text = informationBadges
        imageBadges.image = UIImage(named: namaGambar)
        
        //        leftCharacter.image = #imageLiteral(resourceName: "Char1Yellow")

        
    }

}
