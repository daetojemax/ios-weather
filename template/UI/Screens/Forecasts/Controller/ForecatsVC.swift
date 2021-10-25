import UIKit

final class ForecastsVC<View: ForecastsViewImpl>: BaseViewController<View> {
    typealias OnSelectHotel = (Int) -> Void
    
    private var provider: ForecastProvider
    private var geo: GeoService
    
    init(provider: ForecastProvider,
         geo: GeoService) {
        self.provider = provider
        self.geo = geo
        super.init(nibName: nil, bundle: nil)
        self.provider.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localize()
        addLoadingAnimation()
        geo.requestLocation { [weak self] lat, lon in
            if let lat = lat, let lon = lon {
                self?.provider.getForecast(with: lat, lng: lon)
            }
        } errorHandler: { [weak self] error in
            self?.createErrorAlert(with: error)
        }
        if geo.serviceDenied() {
            createErrorAlert(with: "Разрешите доступ к геолокации в настройках")
        }
    }
    
    private func localize() {
        title = loc("FORECAST")
    }
    
    private func makeForecastsViewInputData(from forecasts: [DtoForecast]) -> ForecastsViewInputData {
        ForecastsViewInputData(forecasts: forecasts.map(makeForecastTableCellInputData))
    }
    
    private func makeForecastTableCellInputData(from forecast: DtoForecast) -> ForecastViewCellInputData {
        ForecastViewCellInputData(dt: forecast.dt, date: forecast.date, weather: Int(forecast.main?.temp ?? 0), onSelect: {})
    }
}

extension ForecastsVC: ForecastProviderDelegate {
    func forecastsReady(_ forecasts: [DtoForecast]) {
        removeLoadingAnimation()
        rootView.update(with: makeForecastsViewInputData(from: forecasts))
    }
}
