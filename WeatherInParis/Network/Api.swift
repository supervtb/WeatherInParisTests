//
//  Api.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 03/03/2024.
//

import Foundation
import Combine
import Alamofire

protocol Api {
    func loadWeather() -> AnyPublisher<WeatherModel, AFError>
    func loadForecast() -> AnyPublisher<ForecastModel, AFError>
}
