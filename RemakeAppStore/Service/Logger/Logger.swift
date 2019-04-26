//
// Created by Scott Moon on 2019-04-27.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import Foundation

protocol Logger {
	func log(level: LoggerLevel, message: Any)
}
