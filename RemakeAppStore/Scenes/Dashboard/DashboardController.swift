//
// Created by Scott Moon on 2019-04-27.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import UIKit

import RxCocoa
import RxFlow

class DashboardController: UIViewController, Stepper {

	// MARK: - Protocol Variables

	let steps = PublishRelay<Step>()

	override func viewDidLoad() {
		super.viewDidLoad()

		self.view.backgroundColor = .yellow
	}

}
