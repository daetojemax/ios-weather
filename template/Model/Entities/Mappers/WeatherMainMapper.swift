//
//  WeatherMainMapper.swift
//  template
//
//  Created by Максим Ермолаев on 25.10.2021.
//  Copyright © 2021 Maxim Ermolaev. All rights reserved.
//

import Foundation

class WeatherMainMapper: Mapper<DtoWeatherMain, RWeatherMain> {
    
    override func mapTo(item: RWeatherMain) -> DtoWeatherMain? {
        return DtoWeatherMain(realmObject: item)
    }
    
    override func mapFrom(item: DtoWeatherMain) -> RWeatherMain? {
        return RWeatherMain(dto: item)
    }
}
