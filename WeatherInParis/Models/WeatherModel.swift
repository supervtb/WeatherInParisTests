//
//  WeatherModel.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 02/03/2024.
//
import Foundation

struct Main: Decodable {
    var temp: Double
    var feelsLike: Double
    var tempMin: Double
    var tempMax: Double
    var pressure: Double
    var humidity: Double

    private enum CodingKeys: String, CodingKey {
        case temp, feelsLike = "feels_like", tempMin = "temp_min", tempMax = "temp_max", pressure, humidity
    }
}

struct Wind: Decodable {
    var speed: Double?
    var deg: Double?
}

struct Weather: Decodable {
    var main: String?
    var description: String?
    var icon: String?
}

struct WeatherModel: Identifiable, Decodable {
    var id: Int?
    var main: Main
    var wind: Wind?
    var weather: [Weather]?
}
