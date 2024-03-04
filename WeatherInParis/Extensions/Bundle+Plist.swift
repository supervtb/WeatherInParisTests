//
//  Bundle+Plist.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 03/03/2024.
//
import Foundation

/// Extension for Bubdle
extension Bundle {

    enum Keys {
        public static let endpoints = "Endpoints"
        public static let accessToken = "accessToken"
        public static let baseUrl = "baseUrl"
        public static let query = "query"
        public static let baseIconUrl = "baseIconUrl"
        public static let iconExtension = "iconExtension"
        public static let baseForecastUrl = "baseForecastUrl"
    }

    static var dictEnvironment: [String: AnyObject] {
        guard let path = Bundle.main.path(forResource: Keys.endpoints, ofType: "plist"),
                let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] else {
            fatalError("Add Endpoints.plist")
        }
        return dict
    }

    static var accessToken: String {
        guard let baseURLString = dictEnvironment[Keys.accessToken] as? String else {
            fatalError("Access token is not found in Endpoints.plist")
        }
        return baseURLString
    }

    static var baseUrl: String {
        guard let baseURLString = dictEnvironment[Keys.baseUrl] as? String else {
            fatalError("Base url is not found in Endpoints.plist")
        }
        return baseURLString
    }

    static var query: String {
        guard let baseURLString = dictEnvironment[Keys.query] as? String else {
            fatalError("Query is not found in Endpoints.plist")
        }
        return baseURLString
    }

    static var baseIconUrl: String {
        guard let baseURLString = dictEnvironment[Keys.baseIconUrl] as? String else {
            fatalError("Base icon url is not found in Endpoints.plist")
        }
        return baseURLString
    }

    static var iconExtension: String {
        guard let baseURLString = dictEnvironment[Keys.iconExtension] as? String else {
            fatalError("Icon extension is not found in Endpoints.plist")
        }
        return baseURLString
    }

    static var baseForecastUrl: String {
        guard let baseURLString = dictEnvironment[Keys.baseForecastUrl] as? String else {
            fatalError("Base forecast url extension is not found in Endpoints.plist")
        }
        return baseURLString
    }
}
