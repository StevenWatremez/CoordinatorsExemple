//
//  AppDelegate.swift
//  Coordinators
//
//  Created by Steven WATREMEZ on 17/12/2017.
//  Copyright © 2017 Steven WATREMEZ. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  // MARK: - Private Properties
  private var appCoordinator: AppCoordinator?
  private var mainViewController: UIViewController {
    let mainViewController = UIViewController()
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    self.window = window
    self.window?.rootViewController = mainViewController
    self.window?.makeKeyAndVisible()
    
    return mainViewController
  }
  
  // MARK: - Life Cycle
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    self.appCoordinator = AppCoordinator(mainViewController: self.mainViewController)
    self.appCoordinator?.start()
    return true
  }
}

