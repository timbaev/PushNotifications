//
//  AppDelegate.swift
//  OutSideInsidePushNotifications
//
//  Created by Ildar Zalyalov on 25.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var notificationManager: NotificationManager?
    var notificationsNavControllerIndex = 1
    var showDetailSegueIdentifier = "showDetailScreen"
    var indexOfNewNotification = 0

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        notificationManager = NotificationManagerImplementation(databaseManager: RealmNotificationDatabaseManager())
            
        registerForNotifications()
        
        return true
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(UNNotificationPresentationOptions.alert)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: - Push notifications

    func registerForNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .alert, .sound]) { [weak self] (isRegistred, error) in

            guard let strongSelf = self else { return }
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }

            strongSelf.getPushNotificationsConfigurations()
        }
    }

    func getPushNotificationsConfigurations() {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in

            guard settings.authorizationStatus == .authorized else { return }

            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("--- Notification received ---")
        
        guard let dataInfo = userInfo as? [String: Any] else { return }
        notificationManager?.reciveNotification(with: dataInfo)
        
        if application.applicationState != .active {
            guard let topController = application.keyWindow?.rootViewController as? UITabBarController else { return }
            let notificationsNavController = topController.viewControllers?[notificationsNavControllerIndex] as? UINavigationController
            let notificationsViewController = notificationsNavController?.topViewController as? NotificationTableViewController
            notificationsViewController?.performSegue(withIdentifier: showDetailSegueIdentifier, sender: indexOfNewNotification)
        }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {

        let tokenParts = deviceToken.map { data -> String in
            return String(format: "%02.2hhx", data)
        }

        let token = tokenParts.joined()
        print("Device Token: \(token)")
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error.localizedDescription)
        print("Failed to register push notifications")
    }

}

