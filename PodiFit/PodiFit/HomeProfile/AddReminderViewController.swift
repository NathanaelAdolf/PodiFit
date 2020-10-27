//
//  AddReminderViewController.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 25/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit
import UserNotifications

 var notifHelper = NotificationHelper()

class AddReminderViewController: UIViewController {

    @IBOutlet weak var timePickerView: UIDatePicker!
    
    @IBOutlet weak var monButton: UIButton!
    @IBOutlet weak var tueButton: UIButton!
    @IBOutlet weak var wedButton: UIButton!
    @IBOutlet weak var thuButton: UIButton!
    @IBOutlet weak var friButton: UIButton!
    @IBOutlet weak var satButton: UIButton!
    @IBOutlet weak var sunButton: UIButton!
    
    var monFlag: Int = 0
    var tueFlag: Int = 0
    var wedFlag: Int = 0
    var thuFlag: Int = 0
    var friFlag: Int = 0
    var satFlag: Int = 0
    var sunFlag: Int = 0
    
    @IBOutlet weak var reminderNameTextField: UITextField!
    
    var userChoosenDayArray: [String] = []
    
    var tempReminderName : String = ""
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUIButtonToUnselected(sender: monButton)
        setUIButtonToUnselected(sender: tueButton)
        setUIButtonToUnselected(sender: wedButton)
        setUIButtonToUnselected(sender: thuButton)
        setUIButtonToUnselected(sender: friButton)
        setUIButtonToUnselected(sender: satButton)
        setUIButtonToUnselected(sender: sunButton)
        
        timePickerView.datePickerMode = .time
        timePickerView.locale = Locale(identifier: "id_ID")
        
        notifHelper.configureUserNotificationCenter()
      
    }
    
    @IBAction func mondayPressed(_ sender: Any) {
        if monFlag == 0 {
            setUIButtonToSelected(sender: monButton)
            monFlag = 1
        }
        else
        {
            setUIButtonToUnselected(sender: monButton)
            monFlag = 0
        }
    }
    
    @IBAction func tuePress(_ sender: Any) {
        if tueFlag == 0 {
           setUIButtonToSelected(sender: tueButton)
           tueFlag = 1
        }
       else{
           setUIButtonToUnselected(sender: tueButton)
           tueFlag = 0
       }
    }
    
    @IBAction func wedPress(_ sender: Any) {
        if wedFlag == 0 {
          setUIButtonToSelected(sender: wedButton)
          wedFlag = 1
        }
      else{
          setUIButtonToUnselected(sender: wedButton)
        wedFlag = 0
          }
    }
    
    
    @IBAction func thuPress(_ sender: Any) {
        
        if thuFlag == 0 {
         setUIButtonToSelected(sender: thuButton)
         thuFlag = 1
        }
     else{
         setUIButtonToUnselected(sender: thuButton)
       thuFlag = 0
         }
    }
    
    @IBAction func friPress(_ sender: Any) {
        if friFlag == 0 {
         setUIButtonToSelected(sender: friButton)
         friFlag = 1
        }
     else{
         setUIButtonToUnselected(sender: friButton)
            friFlag = 0
         }
    }
    
    @IBAction func satPress(_ sender: Any) {
        if satFlag == 0 {
         setUIButtonToSelected(sender: satButton)
         satFlag = 1
        }
     else{
         setUIButtonToUnselected(sender: satButton)
       satFlag = 0
         }
    }
    
    @IBAction func sunPress(_ sender: Any) {
    if sunFlag == 0 {
         setUIButtonToSelected(sender: sunButton)
         sunFlag = 1
        }
     else{
         setUIButtonToUnselected(sender: sunButton)
       sunFlag = 0
         }
    }
    
    func setUIButtonToSelected(sender: UIButton)
    {
        sender.backgroundColor = UIColor.systemBlue
        sender.setTitleColor(.white, for: .normal)
        sender.layer.cornerRadius = 5
    }
    func setUIButtonToUnselected(sender: UIButton)
    {
        sender.backgroundColor = UIColor.white
        sender.layer.borderColor = UIColor.blue.cgColor
        sender.layer.borderWidth = 1
        sender.layer.cornerRadius = 5
        sender.setTitleColor(.systemBlue, for: .normal)
    }
    
    func checkuserChoosenDay()
    {
        if monFlag == 1 {
            userChoosenDayArray.append("Monday")
        }
        if tueFlag == 1 {
            userChoosenDayArray.append("Tuesday")
        }
        if wedFlag == 1 {
            userChoosenDayArray.append("Wednesday")
        }
        if thuFlag == 1 {
            userChoosenDayArray.append("Thursday")
        }
        if friFlag == 1 {
            userChoosenDayArray.append("Friday")
        }
        if satFlag == 1 {
            userChoosenDayArray.append("Saturday")
        }
        if sunFlag == 1 {
            userChoosenDayArray.append("Sunday")
        }
    }
    
    func checkUserChoosenDate(arrayIndex: Int)->String
    {
      
            if timePickerView.date.getHourMinute().minute > 9 && timePickerView.date.getHourMinute().hour > 9 {
                return "\(userChoosenDayArray[arrayIndex]) \(timePickerView.date.getHourMinute().hour):\(timePickerView.date.getHourMinute().minute):00"
            }

           else if timePickerView.date.getHourMinute().minute > 9 && timePickerView.date.getHourMinute().hour <= 9 {
                return "\(userChoosenDayArray[arrayIndex]) 0\(timePickerView.date.getHourMinute().hour):\(timePickerView.date.getHourMinute().minute):00"
            }
                
           else if timePickerView.date.getHourMinute().minute < 9 && timePickerView.date.getHourMinute().hour <= 9 {
               return "\(userChoosenDayArray[arrayIndex]) 0\(timePickerView.date.getHourMinute().hour):0\(timePickerView.date.getHourMinute().minute):00"
                }
                
            else  {
              return "\(userChoosenDayArray[arrayIndex]) \(timePickerView.date.getHourMinute().hour):0\(timePickerView.date.getHourMinute().minute):00"
               }
        
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveAction(_ sender: Any) {
        if reminderNameTextField.text == "" {
            //kasih pesan error
        }
        else
        {
            notifHelper.triggerNotification()
            
            userChoosenDayArray.removeAll()
            checkuserChoosenDay()
            tempReminderName = reminderNameTextField.text!
            
            //save ke core data notifnya
            for i in 0...userChoosenDayArray.count - 1 {
                notifHelper.scheduleNotification(reminderName:"\(tempReminderName)\(i)", dateToPush:checkUserChoosenDate(arrayIndex: i) )
                print("\(tempReminderName)\(i) \(checkUserChoosenDate(arrayIndex: i))")
            }
            
 
        }
    }
  

}


