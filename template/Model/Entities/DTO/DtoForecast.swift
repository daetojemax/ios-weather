//
//  DtoForecast.swift
//  template
//
//  Created by Максим Ермолаев on 25.10.2021.
//  Copyright © 2021 Maxim Ermolaev. All rights reserved.
//

import Foundation

struct DtoForecast: Codable {
    var dt: Int
    var main: DtoWeatherMain?
    var date: String
    
    enum CodingKeys: String, CodingKey {
        case dt
        case main
        case date = "dt_txt"
    }
    
    init(realmObject: RForecast) {
        self.dt = realmObject.dt
        self.date = realmObject.date
        if let main = realmObject.main {
            self.main = WeatherMainMapper().mapTo(item: main)
        }
    }
}
