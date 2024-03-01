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

    private let vmFactory = ViewModelFactory()

    init() {
        // Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.main]

        // Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.main]
    }

    var body: some Scene {
        WindowGroup {
            RouterView(router: router) { path in
                Group {
                    switch path {
                    case .homeScreen:
                        HomeView(viewModel: vmFactory.buildHomeViewModel())
                    case .detailsScreen:
                        DetailsView(viewModel: vmFactory.buildDetailsViewModel())
                    }
                }
            }
        }
    }
}
