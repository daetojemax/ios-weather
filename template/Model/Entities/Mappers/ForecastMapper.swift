//
//  ForecastMapper.swift
//  template
//
//  Created by Максим Ермолаев on 25.10.2021.
//  Copyright © 2021 Maxim Ermolaev. All rights reserved.
//

import Foundation

class ForecastMapper: Mapper<DtoForecast, RForecast> {
    
    override func mapTo(item: RForecast) -> DtoForecast? {
        return DtoForecast(realmObject: item)
    }
    
    override func mapFrom(item: DtoForecast) -> RForecast? {
        return RForecast(dto: item)
    }
}
