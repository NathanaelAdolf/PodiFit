//
//  ExitViewController.swift
//  PodiFit
//
//  Created by Muhamad Vicky on 04/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class ExitViewController: UIViewController {
    
    @IBOutlet weak var exitView : ExitView!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.isHidden = true
        exitView.exitViewPopup()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func resumeExercise(_ sender: Any) {
        print("masuk")
        
        navigationController?.popViewController(animated: true)
    }
    

    @IBAction func restartExercise(_ sender: Any) {
        
    }
    
    @IBAction func quitExercise(_ sender: Any) {
        
    }
}
