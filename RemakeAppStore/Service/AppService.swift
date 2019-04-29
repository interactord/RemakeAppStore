//
// Created by Scott Moon on 2019-04-27.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import Foundation

import ServiceKitLogger

struct AppService: Service {
  let appEnvConfig: AppEnvConfig
	let logger: ServiceKitLogger.Logger
}
