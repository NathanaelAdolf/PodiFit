//
//  ExerciseSummaryViewController.swift
//  PodiFit
//
//  Created by Muhamad Vicky on 02/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit


class ExerciseSummaryViewController: UIViewController {

    @IBOutlet weak var  exerciseSummaryView : ExerciseSummaryView!
    
    let reviewService = ReviewService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let deadline = DispatchTime.now() + .seconds(2)
        DispatchQueue.main.asyncAfter(deadline: deadline) { [weak self] in
            self?.reviewService.requestReview()
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
