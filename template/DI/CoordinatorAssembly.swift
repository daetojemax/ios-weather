//
//  CoordinatorAssembly.swift
//  template
//
//  Created by Максим Ермолаев on 17.06.2020.
//  Copyright © 2020 Maxim Ermolaev. All rights reserved.
//

import UIKit
import Swinject

class CoordinatorAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(CoordinatorFactory.self) {r in CoordinatorFactoryImpl(screenFactory: container.resolve(ScreenFactory.self)!) }
    }
}
