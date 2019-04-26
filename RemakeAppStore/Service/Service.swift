//
// Created by Scott Moon on 2019-04-27.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import Foundation

protocol Service {
	var logger: Logger { get }
	var envManager: ServiceEnvManager { get }
}
