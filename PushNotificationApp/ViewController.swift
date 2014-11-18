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
        // This is a point in time, independent of calendars
        let calendar = NSCalendar.currentCalendar()
        // System calendar, likely Gregorian
        let components = calendar.components(NSCalendarUnit(UInt.max), fromDate: datenow)
        // Gregorian components
        components.minute += 1

        var date: NSDate = calendar.dateFromComponents(components)!
        
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

