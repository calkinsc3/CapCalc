//
//  AppDelegate.swift
//  CapCalc
//
//  Created by William Calkins on 7/9/17.
//  Copyright © 2017 Calkins Computer Consulting. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Create a calendar id for store in UserDefaults
        let defaults = UserDefaults.standard
        if let selectedCalendarID = defaults.string(forKey: calendarKeyID) {
            defaults.set(selectedCalendarID, forKey: calendarKeyID)
        } else {
            //create default
            defaults.set(nil, forKey: calendarKeyID)
        }
        
        defaults.synchronize()
        
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        UserDefaults.standard.synchronize()
    }


}
