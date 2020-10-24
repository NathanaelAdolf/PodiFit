//
//  ExerciseViewController.swift
//  PodiFit
//
//  Created by Muhamad Vicky on 23/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit
import WebKit

class ExerciseViewController: UIViewController {

    @IBOutlet weak var exerciseView : ExerciseView!
    
    var isVideo: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup View
        exerciseView.videoView()

        

    }
    
    
    @IBAction func informationExercise(_ sender: Any) {
        
    }
    
    @IBAction func previous(_ sender: Any) {
        if isVideo == 1 {
            isVideo = 2
            exerciseView.videoView()
        }
    }
    
    @IBAction func next(_ sender: Any) {
        if isVideo == 2 {
            exerciseView.restView()
            isVideo = 1
        }
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
