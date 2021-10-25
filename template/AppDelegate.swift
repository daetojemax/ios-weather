//
//  AppDelegate.swift
//  template
//
//  Created by Максим Ермолаев on 17.06.2020.
//  Copyright © 2020 Maxim Ermolaev. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private var container: MainContainer!
    private var appCoordinator: Coordinator?

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        container = MainContainer()
        runUI()
        return true
    }
    
    private func runUI() {
        let (window, coordinator) = container.start()
        self.window = window
        self.appCoordinator = coordinator
        
        window.makeKeyAndVisible()
        coordinator.start()
    }
}
