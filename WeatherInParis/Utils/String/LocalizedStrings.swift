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

    func localized() -> String {
        return rawValue.localized()
    }
}
