//
// Created by Scott Moon on 2019-04-28.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import Foundation

import ServiceKitLogger

struct LoggerConfig: ServiceKitLogger.Config, Decodable {
  let appId: String
  let appSecret: String
  let encryptionKey: String
}
