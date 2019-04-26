//
// Created by Scott Moon on 2019-04-27.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import Foundation

struct AppLoggerConfig: Decodable {
	let appId: String
	let appSecret: String
	let encryptionKey: String
}
