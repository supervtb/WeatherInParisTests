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

    @Dependency(\.router) var router
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
    private var bag = Set<AnyCancellable>()

    override init() {
        super.init()
        setupModelState()
    }

    /// Navigate to details view
    ///
    /// - Parameters:
    ///     - router: The main app router.
    ///     - buildView: The closure which creates root view on start.
    func showDetails(forecast: Forecast) {
        router.push(to: .detailsScreen(data: forecast))
    }

    /// Load forecast data
    func refreshData() {
        currentState = .loading
        AF.request(
            "https://api.openweathermap.org/data/2.5/weather?q=Paris&appid=\(Bundle.accessToken)&units=metric"
        )
        .responseDecodable(of: WeatherModel.self) { [weak self] response in
            switch response.result {
            case .success(let data):
                self?.image = URL(
                    string: "https://openweathermap.org/img/wn/\(data.weather?.first?.icon ?? "")@2x.png"
                )
                self?.temperatureString = "\(Int(data.main.temp.rounded()))°"
                self?.weatherType = data.weather?.first?.description?.capitalized ?? ""
                self?.currentState = .success
                self?.loadForecastData()
            case .failure:
                self?.currentState = .failure
            }
        }
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
        let str = "https://openweathermap.org/img/wn/\(string)@2x.png"
        return URL(string: str)
    }

    private func loadForecastData() {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        AF.request(
            "https://api.openweathermap.org/data/2.5/forecast?q=Paris&appid=\(Bundle.accessToken)&units=metric"
        )
        .responseDecodable(of: ForecastModel.self, decoder: decoder) { [weak self] response in
            switch response.result {
            case .success(let data):
                self?.forecast = self?.filterForecasets(forecasts: data.list) ?? []
                self?.currentState = .success
            case .failure(let errpr):
                print(errpr)
                self?.currentState = .failure
            }
        }
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
        }.store(in: &bag)
    }

    private func filterForecasets(forecasts: [Forecast]) -> [Forecast] {
        let slicedData = forecasts.sliced(by: [.year, .month, .day], for: \.dt)
        let filtered = slicedData.compactMap { _, values in
            let midIndex = values.count / 2
            return values[midIndex]
        }
        return filtered.sorted { $0.dt < $1.dt }
    }
}
