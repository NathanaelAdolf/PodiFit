//
//  ExerciseView.swift
//  PodiFit
//
//  Created by Muhamad Vicky on 23/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit
import WebKit

class ExerciseView: UIView {


    @IBOutlet weak var webKitView: WKWebView!
    
    
    @IBOutlet weak var restPageView: UIView!
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var timeRest: UILabel!
    @IBOutlet weak var addRestTimeBtn: UIButton!
    @IBOutlet weak var skipTimeBtn: UIButton!
    @IBOutlet weak var infoNextExerciseLabel: UILabel!
    @IBOutlet weak var nextExerciseLabel: UILabel!
    
    @IBOutlet weak var nameExerciseLabel: UILabel!
    
    @IBOutlet weak var warningView: ExerciseView!
    @IBOutlet weak var contentWarningLabel: UILabel!
    
//    var count = 30
    var timer: Timer?
    
    public func videoView() {
        //for show webkit(video)
        
        webKitView.isHidden = false
        restPageView.isHidden = true
        warningView.isHidden = false
        
        nameExerciseLabel?.text = "Normal Squat"

        let url = URL(string: "https://www.youtube.com/embed/bsM1qdGAVbU?playsinline=1")
        let request = URLRequest(url: url!)
        webKitView.load(request)
        warningExercise()
    }
    
    public func restView() {
        // for hidden webkit view (video) and show page rest
        webKitView.isHidden = true
        restPageView.isHidden = false
        warningView.isHidden = true
        
        addRestTimeBtn.layer.borderWidth = 1
        addRestTimeBtn.layer.borderColor = UIColor.black.cgColor
        addRestTimeBtn.layer.cornerRadius = 5
        
        
        
        
        infoNextExerciseLabel?.text = "NEXT 3/4"
        nextExerciseLabel?.text = "Beginners - Lunge"
        
        nameExerciseLabel?.text = "Thumbnail"

        
    }
    
    public func informationView() {
        
    }
    
    public func warningExercise() {
        
        warningView.layer.cornerRadius = 5
        contentWarningLabel?.text = "This exercise requires heavy rotation"
    }
    
    public func progressExercise() {
        
    }
    
    public func countDownView(count : Int) {
        timeRest?.text = "00 : \(count)"
    }
    
    
}
