import UIKit

class ForecastViewCell: UITableViewCell {

    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblWeather: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @discardableResult
    func setup(with data: ForecastViewCellInputData) -> Self {
        lblDate.text = data.date
        lblWeather.text = "\(data.weather) ℃"
        return self
    }
}

struct ForecastViewCellInputData: Hashable {
    let dt: Int
    let date: String
    let weather: Int
    let onSelect: VoidClosure
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(dt)
    }
    
    static func == (lhs: ForecastViewCellInputData, rhs: ForecastViewCellInputData) -> Bool {
        return lhs.dt == rhs.dt
    }
}
