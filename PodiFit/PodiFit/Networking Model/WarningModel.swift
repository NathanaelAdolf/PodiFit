//
//  WarningModel.swift
//  PodiFit
//
//  Created by Muhamad Vicky on 16/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import Foundation


class WarningModel {
    var idWarning : Int
    var warningText : String
    
    init(idWarning : Int, warningText : String) {
        self.idWarning = idWarning
        self.warningText = warningText
    }
}
