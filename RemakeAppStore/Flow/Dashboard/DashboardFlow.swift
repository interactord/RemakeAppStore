//
// Created by Scott Moon on 2019-04-27.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import UIKit

import RxFlow

class DashboardFlow {

	// MARK: - Private

	private let rootViewController: DashboardController = {
		let controller = DashboardController()
		return controller
	}()

	// MARK: - Initializing

	init() {
	}

	deinit {
		print("\(type(of: self)): \(#function)")
	}

}

extension DashboardFlow: Flow {

	// MARK: - Protocol Variables

	var root: Presentable {
		return rootViewController
	}

	// MARK: - Protocol functions

	func navigate(to step: Step) -> FlowContributors {
		return .none
	}

	// MARK: - functions for protocol

}
