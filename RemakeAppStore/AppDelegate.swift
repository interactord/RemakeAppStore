//
// Created by Scott Moon on 2019-04-27.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  let serviceContainer = ServiceContainer()
  lazy var rootFlow = RootFlow(serviceContainer.getService())

  static let shared: AppDelegate = {
    guard let shared = UIApplication.shared.delegate as? AppDelegate else {
      fatalError("Cannot case  `UIApplication.shared.delegate` to `AppDelegate`")
    }
    return shared
  }()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    window = UIWindow()

    guard let window = window else {
      return false
    }

    rootFlow.onDebugNavigate()
    rootFlow.startFlow(with: window)

    return true
  }

}
