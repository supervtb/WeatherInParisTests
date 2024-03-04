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
    
    /// Load weather data
    /// - Returns: Weather model or Error.
    func loadWeather() -> AnyPublisher<WeatherModel, AFError>

    /// Load forecast data
    /// - Returns: Forecast model or Error.
    func loadForecast() -> AnyPublisher<ForecastModel, AFError>
}
