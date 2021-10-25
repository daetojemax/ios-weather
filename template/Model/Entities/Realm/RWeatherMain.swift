//
//  RWeatherMain.swift
//  template
//
//  Created by Максим Ермолаев on 25.10.2021.
//  Copyright © 2021 Maxim Ermolaev. All rights reserved.
//

import Foundation
import RealmSwift

class RWeatherMain: Object {

    @objc dynamic var temp: Float = 0
    
    override init() {
        super.init()
    }
    
    init(dto: DtoWeatherMain) {
        super.init()
        self.temp = dto.temp
    }
//
//    override class func primaryKey() -> String? {
//        return "id"
//    }
//
}
