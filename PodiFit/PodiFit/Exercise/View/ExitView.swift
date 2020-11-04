//
//  ExitView.swift
//  PodiFit
//
//  Created by Muhamad Vicky on 04/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class ExitView: UIView {

    @IBOutlet weak var popupExit: UIView!
    
    func exitViewPopup () {
        popupExit.layer.cornerRadius = 10
    }

}
