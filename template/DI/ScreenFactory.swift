//
//  ScreenFactory.swift
//  template
//
//  Created by Максим Ермолаев on 17.06.2020.
//  Copyright © 2020 Maxim Ermolaev. All rights reserved.
//

import Foundation
import Swinject

protocol ScreenFactory {
    
    func makeSplashScreen() -> SplashScreenVC<SplashScreenViewImpl>
    
    func makeWeatherScreen() -> CurrentWeatherVC<CurrentWeatherViewImpl>
    
    func makeTabsScreen() -> TabsViewController
    
    func makeForecastScreen() -> ForecastsVC<ForecastsViewImpl>
}

final class ScreenFactoryImpl: ScreenFactory {
    
    fileprivate var container: Container!
    
    init(container: Container) {
        self.container = container
    }
    
    func makeSplashScreen() -> SplashScreenVC<SplashScreenViewImpl> {
        return SplashScreenVC<SplashScreenViewImpl>()
    }
    
    
    func makeWeatherScreen() -> CurrentWeatherVC<CurrentWeatherViewImpl> {
        return CurrentWeatherVC<CurrentWeatherViewImpl>(provider: container.resolve(WeatherProvider.self)!,
                                                        geo: container.resolve(GeoService.self)!)
    }
    
    func makeForecastScreen() -> ForecastsVC<ForecastsViewImpl> {
        return ForecastsVC<ForecastsViewImpl>(provider: container.resolve(ForecastProvider.self)!,
                                              geo: container.resolve(GeoService.self)!)
    }
    
    func makeTabsScreen() -> TabsViewController {
        let weather = makeWeatherScreen()
        let ncWeather  = UINavigationController(rootViewController: weather)
        ncWeather.tabBarItem = UITabBarItem(title: loc("WEATHER"), image: nil, selectedImage: nil)
        
        let forecast = makeForecastScreen()
        let ncForecast = UINavigationController(rootViewController: forecast)
        ncForecast.tabBarItem = UITabBarItem(title: loc("FORECAST"), image: nil, selectedImage: nil)
        return TabsViewController(tabControllers: [ncWeather, ncForecast])
    }
}
