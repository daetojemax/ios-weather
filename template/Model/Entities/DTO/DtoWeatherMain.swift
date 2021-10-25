//
//  DtoWeatherMain.swift
//  template
//
//  Created by Максим Ермолаев on 22.10.2021.
//  Copyright © 2021 Maxim Ermolaev. All rights reserved.
//

import Foundation

struct DtoWeatherMain: Codable {
    var temp: Float
    
    init(realmObject: RWeatherMain) {
        self.temp = realmObject.temp
    }
}
