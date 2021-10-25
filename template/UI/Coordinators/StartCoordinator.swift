import Foundation

final class StartCoordinator: BaseCoordinator {
    
    var finishFlow: VoidClosure?
    
    private let screenFactory: ScreenFactory
    private let router: Router
    
    init(router: Router, screenFactory: ScreenFactory) {
        self.screenFactory = screenFactory
        self.router = router
    }
    
    override func start() {
        showSplash()
    }
    
    private func showSplash() {
        let splashScreen = screenFactory.makeSplashScreen()
        splashScreen.onCheck = { [weak self] in
            self?.finishFlow?()
        }
        
        router.setRootModule(splashScreen, hideBar: true)
    }
}
