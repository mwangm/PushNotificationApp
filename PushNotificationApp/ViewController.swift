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
        
        
        var dateComp: NSDateComponents  = NSDateComponents()
        dateComp.year = 2014
        dateComp.month = 11
        dateComp.day = 18
        dateComp.hour = 16
        dateComp.minute = 16
        dateComp.timeZone = NSTimeZone.systemTimeZone()
        
        var calendar: NSCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)!
        var date: NSDate = calendar.dateFromComponents(dateComp)!
        
        var notification: UILocalNotification = UILocalNotification()
        notification.category = "FIRST_CATEGORY";
        notification.alertBody = "This is a notification"
        notification.fireDate = date
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func TestShape(notification: NSNotification) {
        println("**********exec shape***********")

        var view: UIView = UIView(frame: CGRectMake(100,100,100,100));
        view.backgroundColor = UIColor.blackColor()
        self.view.addSubview(view)
        
    }
    
    func TestMessage(notification: NSNotification) {
        println("**********exec message***********")

        var message: UIAlertController = UIAlertController(title: "Notification Message", message: "Hello, this is an alert essage", preferredStyle: UIAlertControllerStyle.Alert)
        message.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(message, animated: true, completion: nil)
        
    }


}

