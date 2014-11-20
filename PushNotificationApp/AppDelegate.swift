//
//  AppDelegate.swift
//  PushNotificationApp
//
//  Created by Meng Wang on 11/18/14.
//  Copyright (c) 2014 Meng Wang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool{
        var firstAction: UIMutableUserNotificationAction = UIMutableUserNotificationAction();
        firstAction.identifier = "FIRST_ACTION";
        firstAction.title = "First Action";
        firstAction.activationMode = UIUserNotificationActivationMode.Background;
        firstAction.destructive = true;
        firstAction.authenticationRequired = false;
        
        var secondAction:UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        secondAction.identifier = "SECOND_ACTION";
        secondAction.title = "Second Action";
        secondAction.activationMode = UIUserNotificationActivationMode.Foreground;
        secondAction.destructive = false;
        secondAction.authenticationRequired = false;
        
        
        var firstCategory: UIMutableUserNotificationCategory = UIMutableUserNotificationCategory()
        firstCategory.identifier = "MESSAGE";
        let defaultActions:NSArray = [firstAction, secondAction];
        firstCategory.setActions(defaultActions, forContext: UIUserNotificationActionContext.Default);
        
        let categories: NSSet = NSSet(objects: firstCategory)
        let types:UIUserNotificationType = UIUserNotificationType.Alert | UIUserNotificationType.Badge
        let mySettings: UIUserNotificationSettings = UIUserNotificationSettings(forTypes: types, categories: categories);
        
        UIApplication.sharedApplication().registerUserNotificationSettings(mySettings)
        UIApplication.sharedApplication().registerForRemoteNotifications()
        
        return true
        
    }
    
    func application(application: UIApplication!, handleActionWithIdentifier identifier: String!, forLocalNotification notification: UILocalNotification!, completionHandler: (() -> Void)!) {
        println("---enter local notification handler----")
        
        if identifier == "FIRST_ACTION" {
            println("this is first action")
            NSNotificationCenter.defaultCenter().postNotificationName("actionOne", object: nil)
            
        }else if identifier == "SECOND_ACTION" {
            println("this is second action")
            NSNotificationCenter.defaultCenter().postNotificationName("actionTwo", object: nil)
            
        }
        
        completionHandler()
        
    }
    
    func application(application: UIApplication, handleActionWithIdentifier identifier: String!, forRemoteNotification userInfo: [NSObject : AnyObject]!,
        completionHandler: (() -> Void)!) {
        println("---enter remote notification handler----")
        println(userInfo)

        NSNotificationCenter.defaultCenter().postNotificationName("actionTwo", object: userInfo)
        completionHandler()
    }
    
    func application(application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
            println("device token: \(deviceToken)")
    }
    
    func application(application: UIApplication,
        didFailToRegisterForRemoteNotificationsWithError error: NSError) {
          println("error: \(error)")
    }
    



    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

