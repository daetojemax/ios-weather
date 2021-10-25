import UIKit

final class SplashScreenVC<View: SplashScreenView>: BaseViewController<View> {
    
    var onCheck: VoidClosure?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onCheck?()
    }
}
