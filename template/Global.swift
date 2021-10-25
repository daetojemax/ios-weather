//
//  Global.swift
//  template
//
//  Created by Максим Ермолаев on 20.10.2021.
//  Copyright © 2021 Maxim Ermolaev. All rights reserved.
//

import Foundation

func loc(_ key: String) -> String
{
    return NSLocalizedString(key, comment: "")
}

func getCelsius(from fahrenheit: Float) -> Float {
    return (fahrenheit - 32) / 1.8
}
