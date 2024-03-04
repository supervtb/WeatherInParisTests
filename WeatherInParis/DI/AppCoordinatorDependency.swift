//
//  AppCoordinatorDependency.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 29/02/2024.
//

import Foundation

private struct RouterKey: DependencyKey {
    static var currentValue: Router = Router<RouterPath>(root: .homeScreen)
}

// MARK: - Register Router to Dependencies
extension DependencyValues {
    var router: Router<RouterPath> {
        get { Self[RouterKey.self] }
        set { Self[RouterKey.self] = newValue }
    }
}
