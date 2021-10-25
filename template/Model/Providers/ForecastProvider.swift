//
//  ForecastProvider.swift
//  template
//
//  Created by Максим Ермолаев on 25.10.2021.
//  Copyright © 2021 Maxim Ermolaev. All rights reserved.
//

import Combine
import Foundation

protocol ForecastProviderDelegate: AnyObject {
    func forecastsReady(_ forecasts: [DtoForecast])
}

protocol ForecastProvider {
    
    var delegate: ForecastProviderDelegate? { get set }
    
    func getForecast(with lat: Double, lng: Double)

}

final class ForecastProviderImpl: ForecastProvider {
    
    private let repository: IWeatherRepository
    private var request: AnyCancellable?
    
    var delegate: ForecastProviderDelegate?
    
    init(repository: IWeatherRepository) {
        self.repository = repository
    }
    
    func getForecast(with lat: Double, lng: Double) {
        delegate?.forecastsReady(repository.getForecast())
        request = repository.getForecast(with: lat, lon: lng).sink(receiveCompletion: { [weak self] result in
            guard let self = self, case .failure(let error) = result else { return }
            print(error)
        },
        receiveValue: { [weak self] forecast in
            guard let self = self else { return }
            self.delegate?.forecastsReady(forecast.list)
            self.repository.saveForecast(forecast.list)
        })
    }
}
