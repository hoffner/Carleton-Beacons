//
//  AppDelegate.swift
//  Carleton-Beacons
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, ESTBeaconManagerDelegate {

    var window: UIWindow?
    
    // Set the beacon manager's delegate
    let beaconManager = ESTBeaconManager()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let beaconRegion = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "AD54EAF7-D4D4-4598-A635-BE547BB98C63")!, major: 1866, identifier: "test")
        
        ESTConfig.setupAppID("carleton-college-s-own-bea-lvx", andAppToken: "e790d7adccd3a7d60a2449c4e9d6118f")

        // Set the beacon manager's delegate
        self.beaconManager.delegate = self
        
        // Request always access to location services
        self.beaconManager.requestAlwaysAuthorization()
        
        // Start monitoring for beacons in beaconRegion1, even when the app is not running
        // This will show the app icon on the bottom left corner of the lock screen when in range of a beacon
        self.beaconManager.startMonitoringForRegion(beaconRegion)
        
        // Request permission to send notifications
//        UIApplication.sharedApplication().registerUserNotificationSettings(
//            UIUserNotificationSettings(forTypes: .Alert, categories: nil))
        
        // Set global font
        UILabel.appearance().font = UIFont(name: "TrebuchetMS", size: 14)
        
        // Override point for customization after application launch.
        return true
    }
    
    // Present notification when user enters a region
//    func beaconManager(manager: AnyObject, didDetermineState region: CLBeaconRegion) {
//        let notification = UILocalNotification()
//        notification.alertBody =
//            "You're in range of a beacon!"
//        UIApplication.sharedApplication().presentLocalNotificationNow(notification)
//    }

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
