//
//  ScreenAssembly.swift
//  template
//
//  Created by Максим Ермолаев on 17.06.2020.
//  Copyright © 2020 Maxim Ermolaev. All rights reserved.
//

import UIKit
import Swinject

class ScreenAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(ScreenFactory.self) {r in ScreenFactoryImpl(container: container) }
    }
}
