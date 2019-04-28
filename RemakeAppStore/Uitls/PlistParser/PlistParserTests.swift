//
// Created by Scott Moon on 2019-04-28.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
@testable import RemakeAppStore

class PlistParserTests: XCTestCase {

  let sut = PlistParser()

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  func test_decode_when_no_path() {
    let pareData: AppEnvConfig? = sut.decode()
    XCTAssertNil(pareData)
  }

  func test_decode_when_correct_path() {
    let path = Bundle.main.url(forResource: "env", withExtension: "plist")
    let parseData: AppEnvConfig? = sut.decode(path)
    XCTAssertNotNil(parseData)
  }

  func test_decode_when_incorrect_path() {
    let path = Bundle.main.url(forResource: "test", withExtension: "plist")
    let parseData: AppEnvConfig? = sut.decode(path)
    XCTAssertNil(parseData)
  }

  func test_decode_when_incorrect_plist_file() {
    let path = Bundle.main.url(forResource: "test", withExtension: "plist")
    let parseData: AppEnvConfig? = sut.decode(path)
    XCTAssertNil(parseData)
  }
}
