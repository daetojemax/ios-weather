//
//  ProvidersAssembly.swift
//  template
//
//  Created by Максим Ермолаев on 21.10.2021.
//  Copyright © 2021 Maxim Ermolaev. All rights reserved.
//

import Foundation
import Swinject

class ProvidersAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(WeatherProvider.self) {r in WeatherProviderImpl(repository: r.resolve(IWeatherRepository.self)!) }
        
        container.register(ForecastProvider.self) {r in ForecastProviderImpl(repository: r.resolve(IWeatherRepository.self)!) }
    }
}
