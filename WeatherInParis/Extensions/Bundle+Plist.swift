//
//  Bundle+Plist.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 03/03/2024.
//
import Foundation

extension Bundle {

    enum Keys {
        public static let endpoints = "Endpoints"
        public static let accessToken = "accessToken"
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
}
