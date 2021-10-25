//
//  DtoWeather.swift
//  template
//
//  Created by Максим Ермолаев on 22.10.2021.
//  Copyright © 2021 Maxim Ermolaev. All rights reserved.
//

import Foundation

struct DtoWeather: Codable {
    var id: Int
    var name: String
    var main: DtoWeatherMain
    var weather: [DtoWeatherInfo]
}
