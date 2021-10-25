import UIKit

class BaseViewController<View: UIView>: UIViewController {
    
    typealias OnBackButtonTap = () -> Void
    
    var rootView: View { view as! View }
    
    private var viewLoader: UIView {
        get {
            let screenSize: CGRect = UIScreen.main.bounds
            var _viewLoader: UIView? = nil
            for subview in view.subviews {
                guard subview.tag == -100501 else { continue }
                _viewLoader = subview
            }
            if _viewLoader == nil {
                _viewLoader = UIView(frame: screenSize)
                _viewLoader?.tag = -100501
                _viewLoader?.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
                
                let aiBaseLoading = UIActivityIndicatorView(style: .large)
                aiBaseLoading.color = .gray
                aiBaseLoading.tag = -100502
                aiBaseLoading.center = CGPoint(x: screenSize.width / 2, y: screenSize.height / 2)
                aiBaseLoading.startAnimating()
                
                _viewLoader?.addSubview(aiBaseLoading)
            }
            return _viewLoader!
        }
    }
    
    override func loadView() {
        view = View.loadFromNib()
    }
    
    func addLoadingAnimation(backgroundColor: UIColor = UIColor(white: 1.0, alpha: 0.5), activityColor: UIColor = .gray) {
        viewLoader.removeFromSuperview()
        view.addSubview(viewLoader)
        viewLoader.backgroundColor = .clear
        viewLoader.subviews.forEach {
            if $0.tag == -100502, let activity = $0 as? UIActivityIndicatorView {
                activity.color = activityColor
            }
        }
    }
    
    func removeLoadingAnimation() {
        viewLoader.removeFromSuperview()
    }
    func createErrorAlert(with text: String) {
        let alertController = UIAlertController(title: "Ошибка",
                                                message: text,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "ОК", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
