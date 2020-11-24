//
//  ExerciseView.swift
//  PodiFit
//
//  Created by Muhamad Vicky on 23/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit
import WebKit



class ExerciseView: UIView, WKNavigationDelegate {

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
    @IBOutlet weak var checkImage: UIImageView!
    @IBOutlet weak var imageThumbnail: UIImageView!
    
    @IBOutlet weak var doneView: UIButton!
    
    @IBOutlet weak var circularBarView: UIView!
    @IBOutlet weak var previousView: UIButton!
    @IBOutlet weak var nextView: UIButton!
    @IBOutlet weak var informationView: UIButton!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    public func videoView(dataExercise : [ExerciseModel], tempWarningData : String) {
        
        // setting halaman video dan thumbnail serta warning
        warningView.isHidden = false
        webKitView.isHidden = false
        restPageView.isHidden = true
        
        // untuk menghide halaman rest
        restLabel.isHidden = true
        timeRest.isHidden = true
        skipTimeBtn.isHidden = true
        addRestTimeBtn.isHidden = true
        
        // untuk menampilkan halaman exercise
        nameExerciseLabel.isHidden = false
        informationView.isHidden = false
        progressNumber.isHidden = false
        circularBarView.isHidden = false
        nextView.isHidden = false
        previousView.isHidden = false
        
        //fadein fadeout effect
        self.webKitView.alpha = 0.0
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseOut, animations: {
            self.webKitView.alpha = 1.0
        })
        
        nameExerciseLabel?.text = dataExercise[0].namaExercise
        loadWebsite(dataExercise : dataExercise)
        warningExercise(tempWarningData : tempWarningData)
    }
    
    public func restView(dataExercise : [ExerciseModel], number : Int, totalExercise : Int) {
        loadWebsite(dataExercise: dataExercise)
        
        // fadein fadeout effect
        self.restPageView.alpha = 0.0
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseIn, animations: {
            self.restPageView.alpha = 1.0
        })
                
        // setting halaman video dan thumbnail serta warning
        warningView.isHidden = true
        webKitView.isHidden = true
        restPageView.isHidden = false
        
        // untuk menampilkan halaman rest
        restLabel.isHidden = false
        timeRest.isHidden = false
        skipTimeBtn.isHidden = false
        addRestTimeBtn.isHidden = false
        nextExerciseLabel.isHidden = false
        
        // untuk menghide halaman exercise
        nameExerciseLabel.isHidden = true
        informationView.isHidden = true
        progressNumber.isHidden = true
        circularBarView.isHidden = true
        nextView.isHidden = true
        previousView.isHidden = true
        
        // border button
        addRestTimeBtn.layer.borderWidth = 1
        addRestTimeBtn.layer.borderColor = UIColor.black.cgColor
        addRestTimeBtn.layer.cornerRadius = 5
        
        infoNextExerciseLabel?.text = "Next Move"
        nextExerciseLabel?.text = "\(dataExercise[0].namaExercise)"
        imageThumbnail.image = UIImage(named: dataExercise[0].image)
        print("ini masuk labelnya \(dataExercise[0].namaExercise)")
        nameExerciseLabel?.text = "Thumbnail"

        
    }
    
    public func warningExercise(tempWarningData : String) {
        warningView.layer.cornerRadius = 10
        contentWarningLabel?.text = tempWarningData
    }
    
    public func countDownView(count : String) {
        timeRest?.text = "00 : \(count)"
    }
    
    func loadWebsite(dataExercise : [ExerciseModel]) {
        let url = URL(string: "\(dataExercise[0].videoUrl)")
        let request = URLRequest(url: url!)
        webKitView.load(request)
        
        // untuk menambahkan activity indicator pada webview
        webKitView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        webKitView.navigationDelegate = self
        activityIndicator.hidesWhenStopped = true
    }
    
    public func lastExercise() {
        doneView.isHidden = false
        circularBarView.isHidden = false
        previousView.isHidden = true
        nextView.isHidden = true
        progressNumber.isHidden = true
        checkImage.isHidden = false
        warningView.isHidden = true
    }
    
    func setProgressNumber (number : Int, totalExercise : Int) {
        let number = String(number)
        let totalExercise = String(totalExercise)
        progressNumber?.text = "\(number)/\(totalExercise)"
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        activityIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator.stopAnimating()
    }
    
}
