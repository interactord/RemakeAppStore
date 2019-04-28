//
// Created by Scott Moon on 2019-04-27.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import Foundation

import ServiceKitLogger

protocol Service {
	var appEnvConfig: AppEnvConfig { get }
	var logger: ServiceKitLogger.Logger { get }
}
