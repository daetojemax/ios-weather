//
//  Dictionary+toData.swift
//  template
//
//  Created by Максим Ермолаев on 30.06.2021.
//  Copyright © 2021 Maxim Ermolaev. All rights reserved.
//

import Foundation

extension Dictionary where Key: ExpressibleByStringLiteral, Value: AnyObject {
    
    func toData() -> Data? {
        if let d = (self as AnyObject) as? Dictionary<String, AnyObject> {
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: d, options: JSONSerialization.WritingOptions.prettyPrinted)
                return jsonData
            } catch {
                return nil
            }
        }
        return nil
    }
    
}
