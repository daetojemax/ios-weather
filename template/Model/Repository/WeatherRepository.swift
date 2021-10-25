//
//  WeatherRepository.swift
//  template
//
//  Created by Максим Ермолаев on 20.10.2021.
//  Copyright © 2021 Maxim Ermolaev. All rights reserved.
//

import Foundation
import Combine

protocol IWeatherRepository {
    func getWeather(for city: String) -> AnyPublisher<DtoWeather, NetworkError>
    func getWeather(with lat: Double, lon: Double) -> AnyPublisher<DtoWeather, NetworkError>
    func getForecast(with lat: Double, lon: Double) -> AnyPublisher<DtoForecastResponse, NetworkError>
    func saveForecast(_ forecast: [DtoForecast])
    func getForecast() -> [DtoForecast]
}

class WeatherRepository {
    var networkingSession: NetworkingService = NetworkingSession()
    var db: DBStore = DBStore(dbService: RealmServiceImpl())
}

extension WeatherRepository: IWeatherRepository {
    
    func getWeather(for city: String) -> AnyPublisher<DtoWeather, NetworkError> {
        return networkingSession.request(with: WeatherAPI.weatherCity(city))
            .eraseToAnyPublisher()
    }
    
    func getWeather(with lat: Double, lon: Double) -> AnyPublisher<DtoWeather, NetworkError> {
        return networkingSession.request(with: WeatherAPI.weatherCoordinates(lat, lon))
            .eraseToAnyPublisher()
    }
    
    func getForecast(with lat: Double, lon: Double) -> AnyPublisher<DtoForecastResponse, NetworkError> {
        return networkingSession.request(with: WeatherAPI.getForecast(lat, lon))
            .eraseToAnyPublisher()
    }
    
    func saveForecast(_ forecast: [DtoForecast]) {
        db.delete(RForecast.self, byFilter: nil, complition: { [weak self] in
            self?.db.set(ForecastMapper(), data: forecast, complitationHandler: {})
        })
    }
    
    func getForecast() -> [DtoForecast] {
        return db.get(ForecastMapper()) ?? []
    }
}
