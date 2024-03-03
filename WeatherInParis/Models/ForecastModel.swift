//
//  ForecastModel.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 03/03/2024.
//

import Foundation

struct ForecastModel: Decodable {
    var list: [Forecast]
}

struct Forecast: Hashable, Decodable {
    var dt: Date
    var main: Main
    var weather: [Weather]
    var wind: Wind?

    static func == (lhs: Forecast, rhs: Forecast) -> Bool {
        return lhs.dt == rhs.dt
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(dt)
    }
}
