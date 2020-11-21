//
//  Colors.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 31/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import Foundation
import UIKit

public class Colors
{
    static var yellowColor: UIColor
    {
        let yellowColor = UIColor.init(red: 0.8941176471, green: 0.9647058824, blue: 0.3137254902, alpha: 1)
        
        return yellowColor
    }
    
    static var backgroundBaseColor: UIColor
    {
        let backgroundBaseColor = UIColor.init(red: 0.2431372549, green: 0.2705882353, blue: 0.2705882353, alpha: 1)
        
        return backgroundBaseColor
    }
    
    static var cellColor: UIColor
    {
        let cellColor = UIColor.init(red: 86/255, green: 95/255, blue: 95/255, alpha: 1)
        
        return cellColor
    }
    
    static var alertCancelColor: UIColor
    {
        let cellColor = UIColor.init(red: 116/255, green: 116/255, blue: 116/255, alpha: 1)
        
        return cellColor
    }
    
}
