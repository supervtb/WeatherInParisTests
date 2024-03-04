//
//  APIDependency.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 03/03/2024.
//

import Foundation

private struct ApiKey: DependencyKey {
    static var currentValue: Api = ApiImpl()
}

// MARK: - Register Router to Dependencies
extension DependencyValues {
    var api: Api {
        get { Self[ApiKey.self] }
        set { Self[ApiKey.self] = newValue }
    }
}
