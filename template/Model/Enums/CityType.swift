//
//  CityType.swift
//  template
//
//  Created by Максим Ермолаев on 24.10.2021.
//  Copyright © 2021 Maxim Ermolaev. All rights reserved.
//

import Foundation

enum CityType: String, CaseIterable {
    case novosibirsk = "Новосибирск"
    case kemerovo = "Кемерово"
    case moscow = "Москва"
}

extension CityType {
    var requestField: String {
        switch self {
            case .kemerovo:
                return "Kemerovo,ru"
            case .novosibirsk:
                return "Novosibirsk,ru"
            case .moscow:
                return "Moscow,ru"
        }
    }
}
