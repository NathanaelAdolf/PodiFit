//
//  NotificationHelper.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 25/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit
import UserNotifications

class NotificationHelper: UIViewController {

    let notificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUserNotificationCenter()
    }
    
    private func configureUserNotificationCenter()
       {
           notificationCenter.delegate = self
       }
    
    func triggerNotification()
    {
        notificationCenter.getNotificationSettings
            { (notificationSettings) in
            switch notificationSettings.authorizationStatus {
                case .notDetermined:
                    self.requestAuthorization(completionHandler: { (success) in
                        guard success else { return }
                                            print("The application is allowed to display notifications")
                    })
                case .authorized:
                                print("The application is allowed to display notifications")
                                self.scheduleNotification()
                case .denied:
                                print("The application is not allowed to display notifications")
        
            case .provisional:
                 print("The application authorized to post non-interruptive user notifications")
            @unknown default:
                                print("Application Not Allowed to Display Notifications")
            }
        }
    }
    
    func scheduleNotification()
    {
        
    }
    
    private func requestAuthorization(completionHandler: @escaping (_ success: Bool) -> ()) {
        // Request Authorization
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (success, error) in
            if let error = error {
                print("Request Authorization Failed (\(error), \(error.localizedDescription))")
            }
            completionHandler(success)
        }
    }

}

//supaya saat appnya jalan notifnya masih bisa muncul
extension NotificationHelper: UNUserNotificationCenterDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert])
    }

}

