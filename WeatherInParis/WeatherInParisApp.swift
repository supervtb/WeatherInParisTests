//
//  WeatherInParisApp.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 28/02/2024.
//

import SwiftUI

@main
struct WeatherInParisApp: App {
    @Dependency(\.router) var router
    
    var body: some Scene {
        WindowGroup {
            RouterView(router: router) { path in
                Group {
                    switch path {
                    case .homeScreen:
                      HomeView()
                            .navigationTitle(LocalizedStrings.weather.localized())
                    case .detailsScreen:
                      EmptyView()
                    }
                }
            }
        }
    }
}
