//
// Created by Scott Moon on 2019-04-28.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import Foundation

class PlistParser {

  func decode<T: Decodable>(_ path: URL? = nil) -> T? {
    guard let path = path else {
      print("Failed to decode: path is nil")
      return nil
    }

    do {
      let data = try Data(contentsOf: path, options: .mappedIfSafe)
      let decodeData = try PropertyListDecoder().decode(T.self, from: data)
      return decodeData
    } catch {
      print("Failed to decode ", error)
      return nil
    }
  }
}
