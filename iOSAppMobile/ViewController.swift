//
//  ViewController.swift
//  iOSAppMobile
//
//  Created by mwnl on 2019/9/15.
//  Copyright © 2019年 mwnl. All rights reserved.
//


import UIKit
import Foundation
import UserNotifications

var homeToken: String? = nil
var FCMtoken: String? = nil
var detectToken: Bool = false

class ViewController: UIViewController {
    
    let app = UIApplication.shared.delegate as! AppDelegate
    var center: UNUserNotificationCenter?
    let deleteAction = UNNotificationAction(identifier: "DeleteAction",title: "OK", options: [.destructive])
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("UIDevice.current.name = \(UIDevice.current.name)")
    }

    func deniedAlert() {
        let useNotificationsAlertController = UIAlertController(title: "Turn on notifications", message: "This app needs notifications turned on for the best user experience \n ", preferredStyle: .alert)
        
        // go to setting alert action
        let goToSettingsAction = UIAlertAction(title: "Go to settings", style: .default, handler: { (action) in
            guard let settingURL = URL(string: UIApplication.openSettingsURLString) else { return }
            if UIApplication.shared.canOpenURL(settingURL) {
                UIApplication.shared.open(settingURL, completionHandler: { (success) in
                    print("Settings opened: \(success)")
                })
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        useNotificationsAlertController.addAction(goToSettingsAction)
        useNotificationsAlertController.addAction(cancelAction)
        
        self.present(useNotificationsAlertController, animated: true)
    }
    func sendNotification() {
        // Main thread checker
        DispatchQueue.main.async {
            let customID = "Warning"
            let identifier = "DemoNotifiaction" + customID
            let content = UNMutableNotificationContent()
            content.title = "Warning"
            content.body = "Detect Shaking"
            content.sound = UNNotificationSound.default
            content.badge = NSNumber(integerLiteral: UIApplication.shared.applicationIconBadgeNumber + 1)
            content.categoryIdentifier = "DemoNotificationCategory"
            
            // for testing the timeInterval set to 10 sec
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
            
            let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
            self.center?.add(request, withCompletionHandler: {(error) in
                if let error = error {
                    print("\(error)")
                }else {
                    print("successed")
                }
            })
        }
    }
    internal func urlToCentralWeatherbureau(){
        let alertController = UIAlertController(title: "Warning", message: "Detect Shacking", preferredStyle: UIAlertController.Style.alert)
        let okayAction = UIAlertAction(title: "OK", style: .default) { (_) in
            stopAlert()
            let urlString = "https://www.cwb.gov.tw/V8/C/E/index.html#eq-5"
            let url = URL(string: urlString)
            UIApplication.shared.open(url!, options: [UIApplication.OpenExternalURLOptionsKey(rawValue: ""):""], completionHandler: nil)
        }
        alertController.addAction(okayAction)
        present(alertController, animated: true, completion: nil)
        center?.getNotificationSettings { (settings) in
            if settings.authorizationStatus == .authorized {
                self.sendNotification()
            }else if settings.authorizationStatus == .denied {
                self.deniedAlert()
            }else { return }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
