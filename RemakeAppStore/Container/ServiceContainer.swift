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

	func getService() -> Service {

		container.register(Service.self) { [unowned self] _ in

			let service = AppService(
				logger: self.getLogger(),
				envManager: self.getServiceEnvManager()
			)
			return service
		}.inObjectScope(.container)

		guard let service = container.resolve(Service.self) else {
			fatalError("Filed Register Service")
		}
		return service
	}

	// MARK: - Private

	private func register() {

		container.register(ServiceEnvManager.self) { _ in
			let envUrl = Bundle.main.url(forResource: "env", withExtension: "plist")
			let manager = ServiceEnvManager(envUrl)
			return manager
		}.inObjectScope(.container)

		container.register(Logger.self) { resolver in
			guard
				let manager: ServiceEnvManager = resolver.resolve(ServiceEnvManager.self) else {
				fatalError("Failed Register Logger")
			}
			let loggerConfig = manager.serviceEnv?.logger
			let logger = AppLogger(with: loggerConfig)
			return logger
		}.inObjectScope(.container)

	}

	private func getServiceEnvManager() -> ServiceEnvManager {
		guard let manager = container.resolve(ServiceEnvManager.self) else {
			fatalError("Filed Register ServiceEnvManager")
		}
		return manager
	}

	private func getLogger() -> Logger {
		guard let logger = container.resolve(Logger.self) else {
			fatalError("Filed Register Logger")
		}
		return logger
	}

}
