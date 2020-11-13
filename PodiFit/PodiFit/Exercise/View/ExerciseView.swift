//
//  ExerciseView.swift
//  PodiFit
//
//  Created by Muhamad Vicky on 23/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit
import WebKit

var planModelHelper = PlanModel()

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
    @IBOutlet weak var progressNumber: UILabel!
    @IBOutlet weak var warningView: UIView!
    @IBOutlet weak var contentWarningLabel: UILabel!
    
    @IBOutlet weak var nextExerciseView: UIView!
    @IBOutlet weak var timeRestView: UIView!
    
    @IBOutlet weak var doneView: UIButton!
    
    @IBOutlet weak var circularBarView: UIView!
    @IBOutlet weak var previousView: UIButton!
    @IBOutlet weak var nextView: UIButton!
    
    
    var tempExercise = [ExerciseModel]()
    var links = "https://www.youtube.com/embed/xXRU28mfIJQ"
    
    func setupInitial() {
        
    }
    
    public func videoView() {
        //for show webkit(video)
        webKitView.isHidden = false
        restPageView.isHidden = true
        warningView.isHidden = false
        nextExerciseView.isHidden = false
        timeRestView.isHidden = true
        
        //fadein fadeout effect
        self.webKitView.alpha = 0.0
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseOut, animations: {
            self.webKitView.alpha = 1.0
        })
        
        nameExerciseLabel?.text = "STRAIGHT LEG AND CALF RAISE"
        loadWebsite()
        warningExercise()
        
        planModelHelper.fetchIdSteps(idExercise: [1]) //idExercise: [1]
//        print("ini di view \(planModelHelper.fetchPlanUsingEntity())")
        
//        self.tempExercise = planModelHelper.fetchExerciseById()
        print(tempExercise.count)
//        if tempExercise.count == 0 {
//            print(" bener nol\(String(describing: tempExercise[0].namaExercise))")
//
//        }else {
//            print(" bener nol\(String(describing: tempExercise[0].namaExercise))")
//        }
        
        
//
        
    }
    
    public func restView() {
        // stop video in webkit
        loadWebsite()
        
        // fadein fadeout effect
        self.restPageView.alpha = 0.0
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseIn, animations: {
            self.restPageView.alpha = 1.0
        })
                
        // for hidden webkit view (video) and show page rest
        webKitView.isHidden = true
        restPageView.isHidden = false
        warningView.isHidden = true
        timeRestView.isHidden = false
        nextExerciseView.isHidden = true
        
        // border button
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
        warningView.layer.cornerRadius = 10
        contentWarningLabel?.text = "This exercise requires heavy rotation"
    }
    
    public func countDownView(count : String) {
        timeRest?.text = "00 : \(count)"
    }
    
    func loadWebsite() {
        let url = URL(string: "\(links)?playsinline=1")
        let request = URLRequest(url: url!)
        webKitView.load(request)
    }
    
    public func lastExercise() {
        doneView.isHidden = false
        circularBarView.isHidden = false
        previousView.isHidden = true
        nextView.isHidden = true
        progressNumber.isHidden = true
        
        
        
    }
    
    func setProgressNumber (number : Int, totalExercise : Int) {
        let number = String(number)
        let totalExercise = String(totalExercise)
        progressNumber?.text = "\(number)/\(totalExercise)"
    }
    
    
}
