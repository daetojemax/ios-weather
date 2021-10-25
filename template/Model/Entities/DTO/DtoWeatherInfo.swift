//
//  DtoWeatherInfo.swift
//  template
//
//  Created by Максим Ермолаев on 24.10.2021.
//  Copyright © 2021 Maxim Ermolaev. All rights reserved.
//

import Foundation

struct DtoWeatherInfo: Codable {
    var icon: String
}

extension DtoWeatherInfo {
    var iconLink: String {
        return "http://openweathermap.org/img/w/" + icon + ".png"
    }
}
