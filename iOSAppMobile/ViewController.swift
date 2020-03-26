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

var phoneName = ""
var tokenName:String? = nil
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
