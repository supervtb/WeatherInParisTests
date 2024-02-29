//
//  String+Localized.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 29/02/2024.
//

import Foundation

extension String {

    func localized() -> String {
        return NSLocalizedString(self, comment: "\(self)_comment")
    }
}
