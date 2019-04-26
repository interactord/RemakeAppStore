//
// Created by Scott Moon on 2019-04-27.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import Swinject

protocol DIContainable {

	var container: Container { get }
	func getChild() -> Container
	func resolve<Service>(_ service: Service.Type) -> Service?
	func resolve<Service>(_ service: Service.Type, name: String) -> Service?
}

extension DIContainable {

	func getChild() -> Container {
		return Container(parent: container)
	}

	func resolve<Service>(_ serviceType: Service.Type) -> Service? {
		return container.resolve(serviceType)
	}

	func resolve<Service>(_ serviceType: Service.Type, name: String) -> Service? {
		return container.resolve(serviceType, name: name)
	}
}
