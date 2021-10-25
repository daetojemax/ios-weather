//
//  NetworkingService.swift
//  template
//
//  Created by Максим Ермолаев on 30.06.2021.
//  Copyright © 2021 Maxim Ermolaev. All rights reserved.
//

import Combine
import UIKit

protocol NetworkingService {
    func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, NetworkError>
}
