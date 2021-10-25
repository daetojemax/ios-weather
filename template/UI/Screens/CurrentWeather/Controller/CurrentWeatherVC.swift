import UIKit

final class CurrentWeatherVC<View: CurrentWeatherView>: BaseViewController<View> {
    
    private var provider: WeatherProvider
    private var geo: GeoService
    
    init(provider: WeatherProvider,
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
        geo.requestAuthorization()
        geo.requestLocation { [weak self] lat, lon in
            if let lat = lat, let lon = lon {
                self?.addLoadingAnimation()
                self?.provider.getWeather(with: lat, lng: lon)
            }
        } errorHandler: { [weak self] error in
            self?.rootView.setOnSelect { [weak self] type in self?.getWeather(with: type) }
            self?.createErrorAlert(with: error)
        }
        if geo.serviceDenied() {
            rootView.setOnSelect { [weak self] type in self?.getWeather(with: type) }
            createErrorAlert(with: "Разрешите доступ к геолокации в настройках")
        }
    }
    
    private func localize() {
        title = loc("WEATHER")
    }
    
    private func getWeather(with type: CityType) {
        provider.getWeather(for: type.requestField)
    }
}

extension CurrentWeatherVC: WeatherProviderDelegate {
    func weatherReady(_ weather: DtoWeather) {
        rootView.update(with: CurrentWeatherViewInputData(weather: Int(weather.main.temp),
                                                          city: weather.name,
                                                          onSelect: { [weak self] type in self?.getWeather(with: type) },
                                                          imageLink: weather.weather.first?.iconLink ?? ""))
        removeLoadingAnimation()
    }
}
