//
//  RequestBuilder.swift
//  template
//
//  Created by Максим Ермолаев on 30.06.2021.
//  Copyright © 2021 Maxim Ermolaev. All rights reserved.
//

import Foundation

protocol RequestBuilder {
    var urlRequest: URLRequest { get }
}
