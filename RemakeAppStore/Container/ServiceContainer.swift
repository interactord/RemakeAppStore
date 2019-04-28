//
// Created by Scott Moon on 2019-04-27.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import Swinject

import ServiceKitLogger

final class ServiceContainer: DIContainable {

  // MARK: - Private

  var container: Container

  // MARK: - Initializing
  init() {
    container = Container()
    register()
  }

  // MARK: Public
  public func getService() -> Service {
    guard let service = container.resolve(Service.self) else {
      fatalError("Filed Register Service")
    }

    return service
  }
}

// MARK: - Private
extension ServiceContainer {

  private func register() {
    registerService()
  }

  private func registerAppEnvConfig() -> AppEnvConfig {
    container.register(AppEnvConfig.self) { _ in
      let envUrl = Bundle.main.url(forResource: "env", withExtension: "plist")
      let parser = PlistParser()
      guard let config: AppEnvConfig = parser.decode(envUrl) else {
        fatalError("Failed to register at AppEnvConfig")
      }
      return config
    }.inObjectScope(.container)

    guard let config = container.resolve(AppEnvConfig.self) else {
      fatalError("Filed Register AppEnvConfig")
    }

    return config
  }

  private func registerLogger() -> Logger {
    container.register(Logger.self) { resolver in
      guard let config: AppEnvConfig = resolver.resolve(AppEnvConfig.self) else {
        fatalError("Failed Register Logger")
      }
      let loggerConfig = config.logger
      let logger = AppLogger(with: loggerConfig)
      return logger
    }.inObjectScope(.container)

    guard let logger = container.resolve(Logger.self) else {
      fatalError("Filed Register Logger")
    }
    return logger
  }

  private func registerService() {
    container.register(Service.self) { _ in
      let service = AppService(
        appEnvConfig: self.registerAppEnvConfig(),
        logger: self.registerLogger()
      )
      return service
    }.inObjectScope(.container)
  }
}
