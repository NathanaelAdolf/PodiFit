//
//  DetailBadgesModel.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 01/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import Foundation
import UIKit

class DetailBadgesModel
{
    var imageName: String!
    var detailBadgeTitle: String!
    var detailBadgeDescription: String!
    
    init(imageName: String, title: String,description: String) {
        self.imageName = imageName
        self.detailBadgeTitle = title
        self.detailBadgeDescription = description
    }
}
