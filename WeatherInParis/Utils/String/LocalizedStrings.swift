//
//  LocalizedStrings.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 29/02/2024.
//

import Foundation

enum LocalizedStrings: String {
    case weather
    case paris
    case today
    case tempMin
    case tempMax
    case feelsLike
    case pressure
    case humidity
    case windSpeed

    func localized() -> String {
        return rawValue.localized()
    }
}
