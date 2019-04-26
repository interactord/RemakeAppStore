//
// Created by Scott Moon on 2019-04-27.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
@testable import RemakeAppStore

class AppLoggerSpec: XCTestCase {

	var sut: AppLogger?

	override func setUp() {
		super.setUp()
	}

	override func tearDown() {
		super.tearDown()
		sut = nil
	}

	func test_no_injection_config_init() {
		let expected = false

		sut = AppLogger()

		XCTAssertEqual(expected, sut?.isEnvUsable())
	}

	func test_injection_config_init() {
		let mock = AppLoggerConfig(appId: "aaa", appSecret: "aaa", encryptionKey: "aaa")
		let expected = true

		sut = AppLogger(with: mock)

		XCTAssertEqual(expected, sut?.isEnvUsable())
	}
}
