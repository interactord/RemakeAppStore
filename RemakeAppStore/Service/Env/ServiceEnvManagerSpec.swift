//
// Created by Scott Moon on 2019-04-27.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
@testable import RemakeAppStore

class ServiceEnvManagerSpec: XCTestCase {

  var sut: ServiceEnvManager?

  override class func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  func test_noInjection_url_init() {

    sut = ServiceEnvManager()

    XCTAssertNil(sut?.serviceEnv)
  }

  func test_injection_url_init() {

    let url = Bundle.main.url(forResource: "env", withExtension: "plist")

    sut = ServiceEnvManager(url)

    XCTAssertNotNil(sut?.serviceEnv)
  }

}
