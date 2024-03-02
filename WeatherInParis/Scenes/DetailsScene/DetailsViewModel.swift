//
//  DetailsViewModel.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 29/02/2024.
//

import SwiftUI
import Combine

final class DetailsViewModel: BaseViewModel {
    
    @Dependency(\.router) var router
    @Published var currentCity: String = LocalizedStrings.paris.localized()
    @Published var dateString: String = "\(LocalizedStrings.today.localized()), \(Date().formatted(.dateTime.month().day()))"
    @Published var image: URL? = URL(string: "https://openweathermap.org/img/wn/10d@2x.png")
    @Published var weatherType: String = "Cloudy"
    @Published var temperatureString: String = "12"
    @Published var tempMin: String = "12312313"
    @Published var tempMax: String = ""
    @Published var feelsLike: String = ""
    @Published var pressure: String = ""
    @Published var humidity: String = ""
    @Published var windSpeed: String = ""
    @Published var isLoaded: Bool = true
    
    private var bag = Set<AnyCancellable>()

    override init() {
        super.init()
        setupModelState()
    }

    private func setupModelState() {
        $currentState.sink { [weak self] val in
            switch val {
            case .start:
                print("start")
            case .loading:
                print("loading")
                self?.isLoaded = false
            case .success:
                self?.isLoaded = true
            case .failure:
                print("error")
            }
        }.store(in: &bag)
    }
}
