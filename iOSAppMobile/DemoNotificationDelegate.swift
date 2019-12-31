//
//  DemoNotificationDelegate.swift
//  DeomoUserNotification
//
//  Created by mwnl on 2019/9/22.
//  Copyright © 2019年 mwnl. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class DemoNotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Play sound and show alert to the user
        completionHandler([.alert, .sound, .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        // Determine the user action
        switch response.actionIdentifier {
        case UNNotificationDismissActionIdentifier:
            print("Dismiss Action")
        case UNNotificationDefaultActionIdentifier:
            print("Default")
            let urlString = "https://www.cwb.gov.tw/V8/C/E/index.html#eq-5"
            let url = URL(string: urlString)
            UIApplication.shared.open(url!, options: [UIApplication.OpenExternalURLOptionsKey(rawValue: ""):""], completionHandler: nil)
        case "DeleteAction":
            print("Delete")
            let urlString = "https://www.cwb.gov.tw/V8/C/E/index.html#eq-5"
            let url = URL(string: urlString)
            UIApplication.shared.open(url!, options: [UIApplication.OpenExternalURLOptionsKey(rawValue: ""):""], completionHandler: nil)
        default:
            print("Unknown action")
        }
        
        completionHandler()
    }
    
}
