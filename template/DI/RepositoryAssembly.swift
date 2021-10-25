//
//  RepositoryAssembly.swift
//  template
//
//  Created by Максим Ермолаев on 21.10.2021.
//  Copyright © 2021 Maxim Ermolaev. All rights reserved.
//

import Foundation

import Swinject

class RepositoryAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(IWeatherRepository.self) { r in
            WeatherRepository()
        }
        
        container.register(GeoService.self) { r in
            GeoServiceImpl()
        }
    }
}
