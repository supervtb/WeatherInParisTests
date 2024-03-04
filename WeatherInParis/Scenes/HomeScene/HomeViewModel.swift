//
//  HomeViewModel.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 29/02/2024.
//

import SwiftUI
import Combine
import Alamofire

final class HomeViewModel: BaseViewModel {
    private struct Consts {
        static let doubleFormat: String = "%.2f"
        static let dateFormat: String = "MMMM, d"
    }

    @Dependency(\.router) private var router
    @Dependency(\.api) private var api
    @Published var currentCity: String = LocalizedStrings.paris.localized()
    @Published var dateString: String = {
        return "\(LocalizedStrings.today.localized()), \(Date().formatted(.dateTime.month().day()))"
    }()
    @Published var image: URL? = URL(string: "")
    @Published var weatherType: String = ""
    @Published var temperatureString: String = ""
    @Published var forecast: [Forecast] = []
    @Published var errorMessage: String = ""

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = Consts.dateFormat
        return formatter
    }()
    private let baseIconUrl: String
    private let iconExtension: String
    private var bag = Set<AnyCancellable>()

    init(baseIconUrl: String = Bundle.baseIconUrl, iconExtension: String = Bundle.iconExtension) {
        self.baseIconUrl = baseIconUrl
        self.iconExtension = iconExtension
        super.init()
        setupModelState()
    }

    /// Navigate to details view
    ///
    /// - Parameters:
    ///     - forecast: Forecast model.
    func showDetails(forecast: Forecast) {
        router.push(to: .detailsScreen(data: forecast))
    }

    /// Load forecast data
    func refreshData() {
        currentState = .loading
        api.loadWeather().sink { [weak self] err in
            switch err {
            case .failure:
                self?.currentState = .failure
            default:
                return
            }
        } receiveValue: { [weak self] data in
            self?.image = URL(
                string: "\(self?.baseIconUrl ?? "")\(data.weather?.first?.icon ?? "")\(self?.iconExtension ?? "")"
            )
            self?.temperatureString = "\(Int(data.main.temp.rounded()))°"
            self?.weatherType = data.weather?.first?.description?.capitalized ?? ""
            self?.currentState = .success
            self?.loadForecastData()
        }
        .store(in: &bag)
    }

    /// Format timestamp to date string
    ///
    /// - Parameters:
    ///     - value: Timestamp.
    /// - Returns: Formatted string with date.
    func formattedDateString(from value: Date) -> String {
        return dateFormatter.string(from: value)
    }

    /// Format double value to string
    ///
    /// - Parameters:
    ///     - value: Double.
    /// - Returns: Formatted string with double value.
    func doubleSting(from value: Double) -> String {
        return String(format: Consts.doubleFormat, value)
    }

    /// Create URL from string
    ///
    /// - Parameters:
    ///     - string: URL string.
    /// - Returns: URL.
    func prepareImageUrl(from string: String) -> URL? {
        let str = "\(baseIconUrl)\(string)\(iconExtension)"
        return URL(string: str)
    }

    private func loadForecastData() {
        api.loadForecast().sink { [weak self] err in
            switch err {
            case .failure:
                self?.currentState = .failure
            default:
                return
            }
        } receiveValue: { [weak self] data in
            self?.forecast = self?.filterForecasts(forecasts: data.list) ?? []
            self?.currentState = .success
        }
        .store(in: &bag)
    }

    private func setupModelState() {
        $currentState.sink { [weak self] val in
            switch val {
            case .start:
                print("start")
            case .loading:
                print("loading")
            case .success:
                print("")
            case .failure:
                print("failure")
                self?.errorMessage = LocalizedStrings.baseError.localized()
            }
        }
        .store(in: &bag)
    }

    private func filterForecasts(forecasts: [Forecast]) -> [Forecast] {
        let slicedData = forecasts.sliced(by: [.year, .month, .day], for: \.dt)
        let filtered = slicedData.compactMap { _, values in
            let midIndex = values.count / 2
            return values[midIndex]
        }
        return filtered.sorted { $0.dt < $1.dt }
    }
}
