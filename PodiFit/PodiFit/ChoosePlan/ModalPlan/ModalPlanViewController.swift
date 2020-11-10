//
//  ModalPlanViewController.swift
//  PodiFit
//
//  Created by Griffin on 03/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit
import WebKit

class ModalPlanViewController: UIViewController {
    
    @IBOutlet weak var infoVideo: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.init(patternImage: UIImage(named: "plan_bg")!)
        
        infoVideo.loadHTMLString("<iframe width=\"100%%\" height=\"100%%\" src=\"https://www.youtube.com/embed/xXRU28mfIJQ?playsinline=1?&rel=0\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: URL(string: "https://www.youtube.com/embed/xXRU28mfIJQ?playsinline=1"))
        
        // Do any additional setup after loading the view.
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
