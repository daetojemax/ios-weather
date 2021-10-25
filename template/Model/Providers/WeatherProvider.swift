//
//  HotelsListProvider.swift
//  template
//
//  Created by Максим Ермолаев on 20.10.2021.
//  Copyright © 2021 Maxim Ermolaev. All rights reserved.
//

import Combine
import Foundation

protocol WeatherProviderDelegate: AnyObject {
    func weatherReady(_ weather: DtoWeather)
}

protocol WeatherProvider {
    
    var delegate: WeatherProviderDelegate? { get set }
    
    func getWeather(for city: String)
    
    func getWeather(with lat: Double, lng: Double)

}

final class WeatherProviderImpl: WeatherProvider {
    
    private let repository: IWeatherRepository
    private var request: AnyCancellable?
    
    var delegate: WeatherProviderDelegate?
    
    init(repository: IWeatherRepository) {
        self.repository = repository
    }
    
    func getWeather(for city: String) {
        request = repository.getWeather(for: city).sink(receiveCompletion: { [weak self] result in
            guard let self = self, case .failure(let error) = result else { return }
            print(error)
        },
        receiveValue: { [weak self] weather in
            guard let self = self else { return }
            self.delegate?.weatherReady(weather)
        })
    }
    
    func getWeather(with lat: Double, lng: Double) {
        request = repository.getWeather(with: lat, lon: lng).sink(receiveCompletion: { [weak self] result in
            guard let self = self, case .failure(let error) = result else { return }
            print(error)
        },
        receiveValue: { [weak self] weather in
            guard let self = self else { return }
            self.delegate?.weatherReady(weather)
        })
    }
}
