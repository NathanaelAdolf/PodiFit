//
//  InformationExercisionView.swift
//  PodiFit
//
//  Created by Muhamad Vicky on 30/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class InformationExercisionView: UIView {

    @IBOutlet weak var modalView: UIView!
    @IBOutlet weak var dropdown: UIView!
    
    public func setupView() {
        modalView.layer.cornerRadius = 5
        dropdown.layer.cornerRadius = 3
    }
}
