//
//  String+Localized.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 29/02/2024.
//

import Foundation

// MARK: - Extension for string localization
extension String {

    /// Convert string key to localized string
    /// - Returns: Localized string.
    func localized() -> String {
        return NSLocalizedString(self, comment: "\(self)_comment")
    }
}
