//
//  ViewModelFactory.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 29/02/2024.
//

import Foundation

struct ViewModelFactory {
    @Dependency(\.router) private var router: Router

    func buildHomeViewModel() -> HomeViewModel {
        return HomeViewModel()
    }

    func buildDetailsViewModel() -> DetailsViewModel {
        return DetailsViewModel()
    }
}
