//
// Created by Scott Moon on 2019-04-27.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import Swinject

final class ServiceContainer: DIContainable {

	// MARK: - Private

	var container: Container

	// MARK: - Initializing
	init() {
		container = Container()
		register()
	}

	private func register() {
	}

}
