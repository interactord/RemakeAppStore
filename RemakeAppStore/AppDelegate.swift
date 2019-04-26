//
//  AppDelegate.swift
//  RemakeAppStore
//
//  Created by Scott Moon on 26/04/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		window = UIWindow(frame: UIScreen.main.bounds)
		
		let controller = UIViewController()
		controller.view.backgroundColor = .red
		window?.rootViewController = controller
		
		window?.makeKeyAndVisible()
		
		return true
	}
}

