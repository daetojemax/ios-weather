//
//  HotelsCoordinator.swift
//  template
//
//  Created by Максим Ермолаев on 20.10.2021.
//  Copyright © 2021 Maxim Ermolaev. All rights reserved.
//

import Foundation

final class TabsCoordinator: BaseCoordinator {

    private let screenFactory: ScreenFactory
    private let router: Router
    
    init(router: Router, screenFactory: ScreenFactory) {
        self.screenFactory = screenFactory
        self.router = router
    }
    
    override func start() {
        showTabs()
    }
    
    private func showTabs() {
        let tabsScreen = screenFactory.makeTabsScreen()
        router.setRootModule(tabsScreen, hideBar: true)
    }
}
