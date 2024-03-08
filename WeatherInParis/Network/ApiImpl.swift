//
//  ApiImpl.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 04/03/2024.
//

import Foundation
import Combine
import Alamofire

final class ApiImpl: Api {
    
    private(set) var baseUrl: String
    private(set) var appId: String
    private(set) var baseForecastUrl: String
    private(set) var query: String

    init(
        baseUrl: String = Bundle.baseUrl,
        appId: String = Bundle.appId,
        baseForecastUrl: String = Bundle.baseForecastUrl,
        query: String = Bundle.query
    ) {
        self.baseUrl = baseUrl
        self.appId = appId
        self.baseForecastUrl = baseForecastUrl
        self.query = query
    }

    func loadWeather() -> AnyPublisher<WeatherModel, AFError> {
        return request(to: "\(Bundle.baseUrl)\(Bundle.appId)\(Bundle.query)", type: WeatherModel.self)
    }
    
    func loadForecast() -> AnyPublisher<ForecastModel, AFError> {
        return request(
            to: "\(Bundle.baseForecastUrl)\(Bundle.appId)\(Bundle.query)",
            type: ForecastModel.self
        )
    }

    private func request<T: Decodable>(to urlString: String, type: T.Type) -> AnyPublisher<T, AFError> {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return AF.request(urlString)
        .validate()
        .publishDecodable(type: T.self, decoder: decoder)
        .value()
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
