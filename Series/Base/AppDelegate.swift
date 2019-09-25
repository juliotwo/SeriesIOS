//
//  AppDelegate.swift
//  Series
//
//  Created by SalvadorKano on 7/11/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit
import Alamofire
import Firebase
//@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        SplashScreen()
        
        return true
    }
    func initialViewController() {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(AppDelegate.applicationDidTimeout(notification:)),
                                               name: .appTimeout,
                                               object: nil
        )
        window = UIWindow(frame: UIScreen.main.bounds)

        
        var name = "Login"
        let session = UserDefaults.standard.value(forKey: "session") as? Bool ?? false
        if session{
            name = "Search"
            let sessionManager = Alamofire.SessionManager.default
            let accessToken = UserDefaults.standard.value(forKey: "token") as? String ?? ""
            let inter = AccessTokenAdapter(accessToken)
            sessionManager.adapter = inter
            sessionManager.retrier = inter

        }
        let viewController = UIStoryboard(name: name, bundle: Bundle.main).instantiateInitialViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
        
    }
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
       
        
    }
    func SplashScreen() {
        let viewController = UIStoryboard(name: "LaunchScreen", bundle: Bundle.main).instantiateInitialViewController()
              window?.rootViewController = viewController
              window?.makeKeyAndVisible()
         window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = viewController
         window?.makeKeyAndVisible()
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(dimisSpashScreen), userInfo: nil, repeats: false)
        
    }
    
    @objc func dimisSpashScreen(){
        initialViewController()
    }
    func applicationDidEnterBackground(_ application: UIApplication) {
     //

    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
        initialViewController()
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

//    func applicationDidBecomeActive(_ application: UIApplication) {
//
//        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//    }
    
   
    func applicationWillResignActive(_ application: UIApplication) {
        
        self.window?.isHidden = true
     
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
         self.window?.isHidden = false
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    func applicationWillTerminate(_ application: UIApplication) {

        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    @objc func applicationDidTimeout(notification: NSNotification) {
        showAlert(for: "Hola", view: self.window!.rootViewController!)
        print("Se acaboel tiempo de inactividad")
        
    }
    

}

