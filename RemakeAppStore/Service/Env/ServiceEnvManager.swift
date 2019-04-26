//
// Created by Scott Moon on 2019-04-27.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import Foundation

struct ServiceEnvManager {

  private(set) public var serviceEnv: ServiceEnv?
  private let envPathUrl: URL?

  init(_ envPathUrl: URL? = nil) {
    self.envPathUrl = envPathUrl
    serviceEnv = fetchServiceEnv()
  }

  private func fetchServiceEnv() -> ServiceEnv? {
    guard let url = envPathUrl else {
      return nil
    }

    do {

      let data = try Data(contentsOf: url, options: .mappedIfSafe)

      let serviceEnv = try PropertyListDecoder().decode(ServiceEnv.self, from: data)
      return serviceEnv

    } catch {

      print("Failed to fetchLogger: ", error)
      return nil

    }
  }
}
