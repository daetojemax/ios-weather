import UIKit

protocol ForecastsView: UIView {
    func update(with inputData: ForecastsViewInputData)
}

final class ForecastsViewImpl: UIView, ForecastsView {
    
    @IBOutlet weak var stckContainer: UIStackView!
    
    private let forecastsTable = ForecastsTableView.loadFromNib()
    
    private var onByDistance: VoidClosure?
    private var onByRooms: VoidClosure?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        [forecastsTable].forEach(stckContainer.addArrangedSubview)
//        loading(state: false)
    }
    
    func update(with inputData: ForecastsViewInputData) {
        forecastsTable.update(cellData: inputData.forecasts)
    }
}

struct ForecastsViewInputData {
    let forecasts: [ForecastViewCellInputData]
}

