//
//  WeatherAPI.swift
//  template
//
//  Created by Максим Ермолаев on 22.10.2021.
//  Copyright © 2021 Maxim Ermolaev. All rights reserved.
//

import Foundation
import Combine

enum WeatherAPI {
    case weatherCity(String)
    case weatherCoordinates(Double, Double)
    case getForecast(Double, Double)
}

extension WeatherAPI: RequestBuilder {
    
    var urlRequest: URLRequest {
        switch self {
        case .weatherCity(let city):
            guard let url = URL(string: "https://community-open-weather-map.p.rapidapi.com/weather?q=\(city)&units=metric")
                else { preconditionFailure("Invalid URL format") }
            var request = URLComponents(url: url, resolvingAgainstBaseURL: true)?.request
            request?.addValue("community-open-weather-map.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
            request?.addValue("3d6a791383msh66de9c4a7158425p130fdajsnadcad69d1da3", forHTTPHeaderField: "x-rapidapi-key")
            _ = request?.addingMethod(.GET)
            return request!
        case .weatherCoordinates(let lat, let lon):
            guard let url = URL(string: "https://community-open-weather-map.p.rapidapi.com/weather?lat=\(lat)&lon=\(lon)&units=metric")
                else { preconditionFailure("Invalid URL format") }
            var request = URLComponents(url: url, resolvingAgainstBaseURL: true)?.request
            request?.addValue("community-open-weather-map.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
            request?.addValue("3d6a791383msh66de9c4a7158425p130fdajsnadcad69d1da3", forHTTPHeaderField: "x-rapidapi-key")
            _ = request?.addingMethod(.GET)                
            return request!
        case .getForecast(let lat, let lon):
            guard let url = URL(string: "https://community-open-weather-map.p.rapidapi.com/forecast?lat=\(lat)&lon=\(lon)&units=metric")
                else { preconditionFailure("Invalid URL format") }
            var request = URLComponents(url: url, resolvingAgainstBaseURL: true)?.request
            request?.addValue("community-open-weather-map.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
            request?.addValue("3d6a791383msh66de9c4a7158425p130fdajsnadcad69d1da3", forHTTPHeaderField: "x-rapidapi-key")
            _ = request?.addingMethod(.GET)
            return request!
        }
    }
}

private extension URLComponents {
    var request: URLRequest? {
        url.map { URLRequest.init(url: $0) }
    }
}
