//
//  MainContainer.swift
//  template
//
//  Created by Максим Ермолаев on 17.06.2020.
//  Copyright © 2020 Maxim Ermolaev. All rights reserved.
//

import UIKit
import Swinject

class MainContainer
{

    var c: Container!

    init() {
        c = Container()
        let assembler = Assembler(container: c)
        assembler.apply(assemblies: [ScreenAssembly(),
                                     CoordinatorAssembly(),
                                     ProvidersAssembly(),
                                     RepositoryAssembly()])
    }
    
    func start() -> (UIWindow, Coordinator) {
        let window = UIWindow()
        let rootVC = UINavigationController()
        rootVC.navigationBar.prefersLargeTitles = true
        let router = RouterImp(rootController: rootVC)
        let coordinatorFactory = c.resolve(CoordinatorFactory.self)!
        let coordinator = coordinatorFactory.makeApplicationCoordinator(router: router)
        window.rootViewController = rootVC
        return (window, coordinator)
    }
}
