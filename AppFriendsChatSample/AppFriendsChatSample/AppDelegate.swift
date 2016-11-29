
//
//  AppDelegate.swift
//  AFChatUISample
//
//  Created by HAO WANG on 8/22/16.
//  Copyright © 2016 hacknocraft. All rights reserved.
//

import UIKit
import AppFriendsCore
import EZSwiftExtensions

import AppFriendsUI

// Fabric
import Fabric
import Crashlytics

// push
import Firebase
import FirebaseMessaging
import UserNotifications


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        HCSDKCore.sharedInstance.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        styleApp ()
        
        let appFriendsCore = HCSDKCore.sharedInstance
        appFriendsCore.enableDebug()
        
        UsersDataBase.sharedInstance.loadUsers()
        
        Fabric.with([Crashlytics.self])
        
        // Handle notification
        if (launchOptions != nil) {
            
            // For remote Notification
            if let remoteNotification = launchOptions?[UIApplicationLaunchOptionsKey.remoteNotification] as! [AnyHashable: Any]? {
                
                self.processRemoteNotification(remoteNotification)
            }
        }
        
        // push notification
        initializePushNotification(app: application)
        FIRApp.configure()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        FIRMessaging.messaging().disconnect()
        print("Disconnected from FCM.")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        FIRMessaging.messaging().connect { error in
            print(error ?? "")
        }
    }
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    // example of handling remote notification
//    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject])
//    {
//        self.processRemoteNotification(userInfo)
//    }

    // MARK: process notification
    
    func processRemoteNotification(_ userInfo: [AnyHashable: Any])
    {
        // Received remote notification.
        // You can navigate app or process data here
        
    }
    
    // MARK: style the app
    
    func styleApp () {
        
        UITabBar.appearance().backgroundColor = UIColor.white
        
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.setBackgroundImage(UIImage(), for: .default)
        navigationBarAppearace.isTranslucent = false
        navigationBarAppearace.shadowImage = UIImage(named: "667c8c")
        navigationBarAppearace.tintColor = AppFriendsColor.ceruLean
        navigationBarAppearace.backgroundColor = UIColor.white
        navigationBarAppearace.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.black]
        
        HCColorPalette.chatBackgroundColor = UIColor.white
        HCColorPalette.emptyTableLabelColor = AppFriendsColor.charcoalGrey!
        HCColorPalette.navigationBarTitleColor = AppFriendsColor.charcoalGrey!
        HCColorPalette.navigationBarIconColor = AppFriendsColor.ceruLean!
        HCColorPalette.chatDialogListTitleColor = AppFriendsColor.charcoalGrey!
        HCColorPalette.chatDialogTimeStampPreviewColor = AppFriendsColor.coolGray!
        HCColorPalette.chatDialogMessagePreviewColor = AppFriendsColor.coolGray!
        HCColorPalette.chatSystemMessageColor = AppFriendsColor.coolGray!
        HCColorPalette.badgeBackgroundColor = AppFriendsColor.ceruLean!
        
        HCColorPalette.chatOutMessageBubbleColor = AppFriendsColor.ceruLean!
        HCColorPalette.chatInMessageBubbleColor = AppFriendsColor.coolGreyLighter!
        HCColorPalette.chatOutMessageContentTextColor = UIColor.white
        HCColorPalette.chatInMessageContentTextColor = AppFriendsColor.charcoalGrey!
        
        HCColorPalette.chatUserNamelTextColor = AppFriendsColor.coolGray!
        HCColorPalette.avatarBackgroundColor = AppFriendsColor.coolGray!
        HCColorPalette.tableSeparatorColor = AppFriendsColor.coolGray!
        HCColorPalette.tableSectionSeparatorColor = AppFriendsColor.coolGray!
        HCColorPalette.tableBackgroundColor =  AppFriendsColor.coolGreyLighter!
        HCColorPalette.normalTextColor = AppFriendsColor.charcoalGrey!
    }
    
    // MARK: Push notification
    
    func application(_ application: UIApplication, didRegister notificationSettings: UIUserNotificationSettings) {
        
        
        print("didRegisterUserNotificationSettings")
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)
    {
        #if DEBUG
            FIRInstanceID.instanceID().setAPNSToken(deviceToken, type: .sandbox)
        #else
            FIRInstanceID.instanceID().setAPNSToken(deviceToken, type: .prod)
        #endif
        
        // register for push notification
        if HCSDKCore.sharedInstance.isLogin(), let pushToken = FIRInstanceID.instanceID().token(), let currentUserID = HCSDKCore.sharedInstance.currentUserID()
        {
            HCSDKCore.sharedInstance.registerDeviceForPush(currentUserID, pushToken: pushToken)
        }
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
        print("push notification register failed: \(error.localizedDescription)")
    }
    
    func initializePushNotification(app application: UIApplication) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(tokenRefreshNotification), name: NSNotification.Name.firInstanceIDTokenRefresh, object: nil)
        
        let settings: UIUserNotificationSettings =
            UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
        application.registerUserNotificationSettings(settings)
        application.registerForRemoteNotifications()
    }
    
    func tokenRefreshNotification(_ notification: Notification) {
        if let refreshedToken = FIRInstanceID.instanceID().token() {
            print("GCM InstanceID token: \(refreshedToken)")
        }
        
        // Connect to FCM since connection may have failed when attempted before having a token.
        connectToFcm()
        
        // register for push notification
        if HCSDKCore.sharedInstance.isLogin(), let pushToken = FIRInstanceID.instanceID().token(), let currentUserID = HCSDKCore.sharedInstance.currentUserID()
        {
            HCSDKCore.sharedInstance.registerDeviceForPush(currentUserID, pushToken: pushToken)
        }
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        
        // Print full message.
        print("%@", userInfo)
        HCSDKCore.sharedInstance.application(application, didReceiveRemoteNotification: userInfo)
    }
    
    func connectToFcm() {
        FIRMessaging.messaging().connect { (error) in
            if let e = error {
                print("Unable to connect with FCM. \(e)")
            } else {
                print("Connected to FCM.")
            }
        }
    }
    
    // MARK: iPad, UISplitViewControllerDelegate
    
    func splitViewController(_ splitViewController: UISplitViewController, showDetail vc: UIViewController, sender: Any?) -> Bool {
        
        guard !splitViewController.isCollapsed else { return false }
        guard !(vc is UINavigationController) else { return false }
        guard let detailNavController =
            splitViewController.viewControllers.last! as? UINavigationController , detailNavController.viewControllers.count == 1
            else { return false }
        
        detailNavController.pushViewController(vc, animated: true)
        return true
    }
    
}

@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {
    
    // Receive displayed notifications for iOS 10 devices.
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                                        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        // Print message ID.
        print("Message ID: \(userInfo["gcm.message_id"]!)")
        
        // Print full message.
        print("%@", userInfo)
    }
}

extension AppDelegate : FIRMessagingDelegate {
    // Receive data message on iOS 10 devices.
    func applicationReceivedRemoteMessage(_ remoteMessage: FIRMessagingRemoteMessage) {
        print("%@", remoteMessage.appData)
    }
}
