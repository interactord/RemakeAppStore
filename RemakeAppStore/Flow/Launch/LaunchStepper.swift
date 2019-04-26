//
// Created by Scott Moon on 2019-04-27.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import UIKit

import RxFlow
import RxCocoa
import RxSwift

class LaunchSteeper: Stepper {

	// MARK: - Protocol variables

	let steps = PublishRelay<Step>()

	// MARK: - Private

	let disposeBag = DisposeBag()

	init() {
	}

	// MARK: - Protocol functions

	func readyToEmitSteps() {
		Observable.just(Void()).map {
				return AppStep.dashboardIsRequired
		}.bind(to: steps)
			.disposed(by: disposeBag)
	}
}
