//
//  PlanOverviewViewController.swift
//  PodiFit
//
//  Created by Griffin on 06/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit
import CoreData

struct PlanTypes1{
    var title = String()
    var subtitle = String()
    var image = String()
}

class PlanOverviewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var jumlahHari: Int = 0
    var checkSender = 0
    
    var plans = [PlanTypes1]()
    var plan2 = [PlanTypes1]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        if someEntityExists() == false{
            createData()
            print("create")
            
            retrieveData()
            tableView.reloadData()
        }
        else{
            retrieveData()
            tableView.reloadData()
            print("retrieve")
            print("fetched \(plan2.count)")
        }
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("checkSender = \(checkSender)")
        self.tableView.delegate = self

        self.tableView.dataSource = self
        tableView.backgroundColor = UIColor.clear
        
        let backButton = UIBarButtonItem()
        
        backButton.title = ""
        backButton.image = UIImage(named: "chevron.left")
        backButton.tintColor = Colors.yellowColor
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        
        self.view.backgroundColor = UIColor.init(patternImage: UIImage(named: "plan_bg")!)
        //deleteAllDummy(entity: "TestEntity")
        
        self.navigationController?.navigationBar.isHidden = true
        
        //notifHelper.configureUserNotificationCenter()
        
        
        plans = [PlanTypes1(title: "Easy Plan", subtitle: "2 weeks", image: "1"),
                 PlanTypes1(title: "Intermediate Plan", subtitle: "4 weeks", image: "2"),
                 PlanTypes1(title: "Advanced Plan", subtitle: "6 weeks", image: "3")]
        
        tableView.rowHeight = 220.0
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //tableView.register(PlanListTableViewCell.self, forCellReuseIdentifier: "planCell")
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return plan2.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "planCell", for: indexPath) as! PlanListOverviewTableViewCell

        let plan = plan2[indexPath.row]
        cell.planName.text = plan.title
        cell.planSubtitle.text = plan.subtitle
        cell.planImage.image = UIImage(named: plan.image)
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "viewPlanSegue", sender: self)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func createData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let testEntity = (NSEntityDescription.entity(forEntityName: "TestEntity", in: context))!
        
        for i in 1...3 {
            let testplan = NSManagedObject(entity: testEntity, insertInto: context)
            testplan.setValue("Plan No.\(i)", forKeyPath: "planname")
            testplan.setValue("\(i) week(s)", forKeyPath: "duration")
            testplan.setValue("\(i)", forKey: "image")
        }
        
        do{
            try context.save()
        }catch let error as NSError {
            print("Error: \(error), \(error.userInfo)")
        }
    }
    
    func retrieveData(){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return}
        
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TestEntity")
        
        do {
            let result = try context.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                //print(data.value(forKey: "planname") as! String)
                if plan2.count != result.count {
                    plan2.append(PlanTypes1(title: data.value(forKey: "planname") as! String, subtitle: data.value(forKey: "duration") as! String, image: data.value(forKey: "image") as! String))
                }
                //plan2.append(PlanTypes1(title: data.value(forKey: "planname") as! String, subtitle: data.value(forKey: "duration") as! String, image: data.value(forKey: "image") as! String))
            }
                    
        } catch {
            print("Failed")
        }
        
    }
    
    func deleteAllDummy(entity: String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        
        do{
            try context.execute(deleteRequest)
            try context.save()
        }
        catch{
            print("Error deleting data")
        }
        
    }
    
    func someEntityExists() -> Bool {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return false}
        
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TestEntity")

        var entitiesCount = 0

        do {
            entitiesCount = try context.count(for: fetchRequest)
            print("fetch TestEntity successful, \(entitiesCount)")
        }
        catch {
            print("error executing fetch request: \(error)")
        }

        return entitiesCount > 0
    }
    
    func createRealData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let testUser = User(context: context)
        testUser.height = 180
        testUser.plan = [1]
        testUser.idUser = 1
        //testUser.img = UIImage(named: "1") //binary data?
        
        let testPlan = Plan(context: context)
        testPlan.idPlan = 1
        testPlan.durasiPlan = 4
        testPlan.jumlahHari = 12
        testPlan.durasiSessionDay = 10
        testPlan.idDifficulty = 1
        testPlan.namaPlan = "Easy Leg Plan"
        testPlan.totalSessionDone = 0
        testPlan.chosenExercise = [1, 2, 3]
        testPlan.isPlanDone = false
        
        let exercise1 = Exercise(context: context)
        exercise1.idDifficulty = 1
        exercise1.idExercise = 1
        exercise1.namaExercise = "Step Up"
        exercise1.listIdSteps = [1]
        exercise1.videoUrl = ""
        exercise1.warningData = [1]
        
        let exercise2 = Exercise(context: context)
        exercise2.idDifficulty = 1
        exercise2.idExercise = 2
        exercise2.namaExercise = "Frog Hold"
        exercise2.listIdSteps = [1]
        exercise2.videoUrl = ""
        exercise2.warningData = [1]
        
        let exercise3 = Exercise(context: context)
        exercise3.idDifficulty = 1
        exercise3.idExercise = 3
        exercise3.namaExercise = "Glute Bridge"
        exercise3.listIdSteps = [2]
        exercise3.videoUrl = ""
        exercise3.warningData = [1]
        
        let diff = Difficulty(context: context)
        diff.idDifficulty = 1
        diff.levelDifficulty = "Beginner"
        
        let move1 = ExerciseSteps(context: context)
        move1.idStep = 1
        move1.steps = "Berdiri tegak"
        
        let move2 = ExerciseSteps(context: context)
        move2.idStep = 2
        move2.steps = "Berbaring di lantai"
        
        do{
            try context.save()
        }catch let error as NSError {
            print("Error: \(error), \(error.userInfo)")
        }
    }
 
    func fetchRealData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Plan>(entityName: "Plan")
        
        do{
            let tasks = try context.fetch(fetchRequest)
            
            for task in tasks {
                print("\(task.ofUser?.userName ?? "Nama error")")
            }
        }
        catch let error as NSError{
            print("Fetching error, \(error), \(error.userInfo)")
        }
    }
    
}
