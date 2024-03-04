//
//  Paths.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 29/02/2024.
//

import Foundation

/// Navigation paths
enum RouterPath: Hashable {
    case homeScreen
    case detailsScreen(data: Forecast)

    func hash(into hasher: inout Hasher) {
        switch self {
        case .homeScreen:
            break
        case .detailsScreen(let data):
            hasher.combine(data)
        }
    }
}
