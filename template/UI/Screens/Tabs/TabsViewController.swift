//
//  TabsViewController.swift
//  template
//
//  Created by Максим Ермолаев on 24.10.2021.
//  Copyright © 2021 Maxim Ermolaev. All rights reserved.
//

import UIKit

class TabsViewController: UITabBarController {
    
    // MARK: - property
    var controllers: [UINavigationController]!
    
    // MARK: - initial
    
     convenience init(tabControllers: [UINavigationController]) {
        self.init()
        controllers = tabControllers
        selectedIndex = 0
    }

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        tabBar.tintColor = .blue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        selectedIndex = 0
        viewControllers = controllers
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}

extension TabsViewController: UITabBarControllerDelegate {
    
    
}

