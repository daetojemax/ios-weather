//
//  CoordinatorFactory.swift
//  template
//
//  Created by Максим Ермолаев on 17.06.2020.
//  Copyright © 2020 Maxim Ermolaev. All rights reserved.
//

import Foundation

protocol CoordinatorFactory {
    
    func makeApplicationCoordinator(router: Router) -> ApplicationCoordinator
    
    func makeStartCoordinator(router: Router) -> StartCoordinator
    
    func makeTabsCoordinator(router: Router) -> TabsCoordinator
}

final class CoordinatorFactoryImpl: CoordinatorFactory {
    
    private let screenFactory: ScreenFactory
    
    init(screenFactory: ScreenFactory){
        self.screenFactory = screenFactory
    }
    
    func makeApplicationCoordinator(router: Router) -> ApplicationCoordinator {
        return ApplicationCoordinator(router: router, coordinatorFactory: self)
    }
    
    func makeStartCoordinator(router: Router) -> StartCoordinator {
        return StartCoordinator(router: router, screenFactory: screenFactory)
    }
    
    func makeTabsCoordinator(router: Router) -> TabsCoordinator {
        return TabsCoordinator(router: router, screenFactory: screenFactory)
    }
}
