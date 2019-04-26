//
// Created by Scott Moon on 2019-04-27.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift
import RxFlow

class LaunchFlow {

	// MARK: - Private

	private let rootViewController: UIViewController = {
		let navController = UINavigationController()
		navController.setNavigationBarHidden(true, animated: false)
		return navController
	}()

	// MARK: - Initializing

	init() {
	}

	deinit {
		print("\(type(of: self)): \(#function)")
	}

}

extension LaunchFlow: Flow {

	// MARK: - Protocol variables

	var root: Presentable {
		return rootViewController
	}

	// MARK: - Protocol functions

	func navigate(to step: Step) -> FlowContributors {
		guard let step = step as? AppStep else {
			return .none
		}

		switch step {
		case .dashboardIsRequired:
			return navigateToDashboard()
		default: return .none
		}
	}

	// MARK: - functions for protocol

	private func navigateToDashboard() -> FlowContributors {
		return .none
	}

}
