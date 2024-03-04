//
//  DetailsViewModel.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 29/02/2024.
//

import SwiftUI
import Combine

final class DetailsViewModel: BaseViewModel {
    private struct Consts {
        static let doubleFormat: String = "%.2f"
        static let numberFormat: String = "%.f"
        static let dateFormat: String = "MMMM, d"
        static let pressureSymb: String = "hPa"
        static let humiditySymb: String = "%"
        static let windSymb: String = "m/s"
        static let tempSymb: String = "°"
    }

    @Published var currentCity: String = LocalizedStrings.paris.localized()
    @Published var dateString: String = ""
    @Published var image: URL? = URL(string: "")
    @Published var forecast: Forecast
    @Published var weatherType: String = ""
    @Published var temperatureString: String = ""
    @Published var tempMin: String = ""
    @Published var tempMax: String = ""
    @Published var feelsLike: String = ""
    @Published var pressure: String = ""
    @Published var humidity: String = ""
    @Published var windSpeed: String = ""
    @Published var isLoaded: Bool = true
    
    private let baseIconUrl: String
    private let iconExtension: String
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = Consts.dateFormat
        return formatter
    }()
    private var bag = Set<AnyCancellable>()

    init(forecast: Forecast, baseIconUrl: String = Bundle.baseIconUrl, iconExtension: String = Bundle.iconExtension) {
        self.forecast = forecast
        self.baseIconUrl = baseIconUrl
        self.iconExtension = iconExtension
        super.init()
        setupModelState()
    }

    private func setupModelState() {
        $currentState.sink { [weak self] val in
            switch val {
            case .start:
                self?.temperatureString = "\(Int(self?.forecast.main.temp.rounded() ?? 0))\(Consts.tempSymb)"
                self?.dateString = self?.dateFormatter.string(from: self?.forecast.dt ?? Date()) ?? ""
                self?.weatherType = self?.forecast.weather.first?.description?.capitalized ?? ""
                self?.image = URL(
                    string: "\(self?.baseIconUrl ?? "")\(self?.forecast.weather.first?.icon ?? "")\(self?.iconExtension ?? "")"
                )
                self?.tempMin = "\(self?.doubleSting(from: self?.forecast.main.tempMin) ?? "")\(Consts.tempSymb)"
                self?.tempMax = "\(self?.doubleSting(from: self?.forecast.main.tempMax) ?? "")\(Consts.tempSymb)"
                self?.feelsLike = "\(self?.doubleSting(from: self?.forecast.main.feelsLike) ?? "")\(Consts.tempSymb)"
                
                // swiftlint:disable:next line_length
                self?.pressure = "\(self?.doubleSting(from: self?.forecast.main.pressure, format: Consts.numberFormat) ?? "") \(Consts.pressureSymb)"
                // swiftlint:disable:next line_length
                self?.humidity = "\(self?.doubleSting(from: self?.forecast.main.humidity, format: Consts.numberFormat) ?? "")\(Consts.humiditySymb)"
                // swiftlint:disable:next line_length
                self?.windSpeed = "\(self?.doubleSting(from: self?.forecast.wind?.speed, format: Consts.numberFormat) ?? "") \(Consts.windSymb)"
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

    private func doubleSting(from value: Double?, format: String = Consts.doubleFormat) -> String {
        guard let value else { return "" }
        return String(format: format, value)
    }

}
