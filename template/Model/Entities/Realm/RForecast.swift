//
//  RForecast.swift
//  template
//
//  Created by Максим Ермолаев on 25.10.2021.
//  Copyright © 2021 Maxim Ermolaev. All rights reserved.
//

import Foundation
import RealmSwift

class RForecast: Object {
    
    @objc dynamic var dt: Int = 0
    @objc dynamic var date: String = ""
    @objc dynamic var main: RWeatherMain?
    
    override init() {
        super.init()
    }
    
    init(dto: DtoForecast) {
        super.init()
        self.dt = dto.dt
        self.date = dto.date
        if let main = dto.main {
            self.main = WeatherMainMapper().mapFrom(item: main)
        }
    }
    
    override class func primaryKey() -> String? {
        return "dt"
    }
}
