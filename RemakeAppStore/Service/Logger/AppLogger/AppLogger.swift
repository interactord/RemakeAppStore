//
// Created by Scott Moon on 2019-04-27.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//
import Foundation

import SwiftyBeaver

struct AppLogger {

  // MARK: - Private

  private let logger: SwiftyBeaver.Type
  private var envUsable = false

  // MARK: - Initializing

  init(with config: AppLoggerConfig? = nil) {

    logger = SwiftyBeaver.self
    setConsole()

    guard let config = config else {
      return
    }

    let platform = SBPlatformDestination(
      appID: config.appId,
      appSecret: config.appSecret,
      encryptionKey: config.encryptionKey
    )

    logger.addDestination(platform)
    envUsable = true
  }

  // MARK: - Private

  private func setConsole() {
    let console = ConsoleDestination()
    console.asynchronously = false
    console.format = "$DHH:mm:ss.SSS$d $C$L$c - $M"
    logger.addDestination(console)
  }

  func isEnvUsable() -> Bool {
    return envUsable
  }
}

extension AppLogger: Logger {
  public func log(level: LoggerLevel, message: Any) {
    switch level {
    case .debug:
      logger.debug(message)
    case .verbose:
      logger.verbose(message)
    case .info:
      logger.info(message)
    case .warning:
      logger.warning(message)
    case .error:
      logger.error(message)
    }
  }
}
