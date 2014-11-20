//
//  ViewController.swift
//  PushNotificationApp
//
//  Created by Meng Wang on 11/18/14.
//  Copyright (c) 2014 Meng Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        println("**********load view ***********")
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "TestShape:", name: "actionOne", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"TestMessage:", name: "actionTwo", object: nil)

        let datenow = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(NSCalendarUnit(UInt.max), fromDate: datenow)
        components.second += 20

        var date: NSDate = calendar.dateFromComponents(components)!
        
        var notification: UILocalNotification = UILocalNotification()
        notification.category = "MESSAGE";
        notification.alertBody = "This is a notification"
        notification.fireDate = date
        
        //UIApplication.sharedApplication().scheduleLocalNotification(notification)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func TestShape(notification: NSNotification) {
        println("**********exec shape***********")

        var view: UIView = UIView(frame: CGRectMake(100,100,100,100));
        view.backgroundColor = UIColor.blackColor()
        self.view.addSubview(view)
        
    }
    
    func TestMessage(notification: NSNotification) {
        println("**********show message***********")
        println(notification.object)

        var message: UIAlertController = UIAlertController(title: "Notification Message", message: "Hello, this is an alert essage", preferredStyle: UIAlertControllerStyle.Alert)
        message.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(message, animated: true, completion: nil)
        
    }


}

