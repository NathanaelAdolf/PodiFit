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
    @IBOutlet weak var circularProgressView : CircularProgressView!

    
    var count = 30
    var countTimeAddition = 20
    var timer: Timer?
    var isVideo: Int = 1
    var finalExercise = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup View
        circularProgressView.trackClr = UIColor(red: 95/255, green: 104/255, blue: 71/255, alpha: 100)
        circularProgressView.progressClr = UIColor.init(red: 228/255, green: 246/255, blue: 80/255, alpha: 100)
        exerciseView.videoView()
    }
    
    @IBAction func informationExercise(_ sender: Any) {
        self.performSegue(withIdentifier: "toInformationExercise", sender: nil)
    }
    
    @IBAction func previous(_ sender: Any) {
        print(isVideo)
        if isVideo == 2 {
            exerciseView.restView()
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDownTimer), userInfo: nil, repeats: true)
            isVideo = 1
        } else {
            timer?.invalidate()
            exerciseView.countDownView(count: "30")
            circularProgressView.setProgressWithAnimation(duration: 1.0, value: 0.50)
            exerciseView.videoView()
            isVideo = 2
        }
        
    }
    
    @IBAction func next(_ sender: Any) {
        if finalExercise == 3 {
            exerciseView.lastExercise()
        }
//        if isVideo == 1 {
//            timer?.invalidate()
//            exerciseView.countDownView(count: "30")
//            circularProgressView.setProgressWithAnimation(duration: 1.0, value: 0.50)
//            exerciseView.videoView()
//            isVideo = 2
//        } else {
//            exerciseView.restView()
//            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDownTimer), userInfo: nil, repeats: true)
//            isVideo = 1
//        }
    }
    
    @IBAction func doneExercise(_ sender: Any) {
        self.performSegue(withIdentifier: "toReview", sender: nil)
    }
    
    
    @IBAction func Skip(_ sender: Any) {
        timer?.invalidate()
        exerciseView.countDownView(count: "30")
        circularProgressView.setProgressWithAnimation(duration: 1.0, value: 0.50)
        exerciseView.videoView()
        isVideo = 2
        
    }
    
    
    @IBAction func addTimeRest(_ sender: Any) {
        timer?.invalidate()
        exerciseView.countDownView(count: "20")
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(additionTime), userInfo: nil, repeats: true)
        countTimeAddition = 20
    }
    
    @IBAction func exit(_ sender: Any) {
        
    
    }
    
    @objc func countDownTimer(){
        var countString = String(count)
    
        if (count >= 0) {
            if count >= 10 {
                exerciseView.countDownView(count: countString)
                
                count -= 1
                print(countString)
            } else {
                countString = "0\(countString)"
                exerciseView.countDownView(count: countString)
                count -= 1
            }
        }
    }
    
    @objc func additionTime(){
        var countStringAdd = String(countTimeAddition)
        
        if (countTimeAddition >= 0) {
            if countTimeAddition >= 10 {
                exerciseView.countDownView(count: countStringAdd)
                
                countTimeAddition -= 1
                print(countStringAdd)
            } else {
                countStringAdd = "0\(countStringAdd)"
                exerciseView.countDownView(count: countStringAdd)
                countTimeAddition -= 1
            }
        }

        
    }
    
}
