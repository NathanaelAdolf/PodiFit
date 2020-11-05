//
//  HomePlanVC.swift
//  PodiFit
//
//  Created by Hafizul Ihsan Fadli on 03/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class HomePlanVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupDelegate()
        setupRegisterNib()
    }
    
    private func setupDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupRegisterNib() {
        collectionView.register(UINib(nibName: "ActivePlanCell", bundle: nil), forCellWithReuseIdentifier: "ActivePlanCell")
    }
    
    func setupUI() {
        
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

extension HomePlanVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActivePlanCell", for: indexPath) as! ActivePlanCell
        return cell
    }
    

}