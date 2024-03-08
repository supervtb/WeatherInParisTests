//
//  Api.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 03/03/2024.
//

import Foundation
import Combine
import Alamofire

/// Protocol which allows loading data.
protocol Api {

    /// Base API URL
    var baseUrl: String { get }

    /// App ID
    var appId: String { get }

    /// Base forecast URL
    var baseForecastUrl: String { get }

    /// Query params
    var query: String { get }

    /// Load weather data
    /// - Returns: Weather model or Error.
    func loadWeather() -> AnyPublisher<WeatherModel, AFError>

    /// Load forecast data
    /// - Returns: Forecast model or Error.
    func loadForecast() -> AnyPublisher<ForecastModel, AFError>
}
