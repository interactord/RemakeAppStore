//
// Created by Scott Moon on 2019-04-26.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import UIKit

import RxFlow
import RxCocoa
import RxSwift

class RootFlow {

	// MARK: - Private

	private let disposeBag = DisposeBag()
	private let coordinator = FlowCoordinator()

	deinit {
		print("\(type(of: self)): \(#function)")
	}
}

extension RootFlow {

	public func onDebugNavigate() {

		self.coordinator.rx.willNavigate
			.subscribe(onNext: {
				print("will navigate to flow=\($0) and step=\($0)")
			}).disposed(by: disposeBag)

		self.coordinator.rx.didNavigate
			.subscribe(onNext: {
				print("did navigate to flow=\($0) and step=\($0)")
			}).disposed(by: disposeBag)

	}

	public func startFlow(with window: UIWindow) {

		let dashboardFlow = DashboardFlow()

		Flows.whenReady(flow1: dashboardFlow) { root in
			window.rootViewController = root
			window.makeKeyAndVisible()
		}

		self.coordinator.coordinate(flow: dashboardFlow)
	}
}
