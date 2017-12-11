
//  AppDelegate.swift
//  SamadeA-ToDoLists
//
//  Created by AbdulSamade on 10/2/17.
//  Copyright © 2017 AbdulSamade. All rights reserved.
//

import UIKit
import Firebase
import UserNotificationsUI
import UserNotifications
@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        Messaging.messaging().delegate = self
//        func application(_ application: UIApplication, registerForRemoteNotifications: Data) {
        
            if #available(iOS 10.0, *) {
                // For iOS 10 display notification (sent via APNS)
                UNUserNotificationCenter.current().delegate = self as! UNUserNotificationCenterDelegate
                
                let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
                UNUserNotificationCenter.current().requestAuthorization(
                    options: authOptions,
                    completionHandler: {_, _ in })
            } else {
                let settings: UIUserNotificationSettings =
                    UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
                application.registerUserNotificationSettings(settings)
            }
            
            application.registerForRemoteNotifications()
            
//        }
       
        FirebaseApp.configure()
        Database.database().isPersistenceEnabled = true

        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {    }
    func applicationWillEnterForeground(_ application: UIApplication) {    }
    func applicationDidBecomeActive(_ application: UIApplication) {    }
    func applicationWillTerminate(_ application: UIApplication) {    }
        func application(_ application: UIApplication, didRegister notificationSettings : UIUserNotificationSettings) {    }
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {    }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        print("Hello Wasay")
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//
        if let refreshedToken = InstanceID.instanceID().token() {
            print("InstanceID token: \(refreshedToken)")
        }
    }

    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        print(">>> Firebase registration token: \(fcmToken)")
        
    }
}




