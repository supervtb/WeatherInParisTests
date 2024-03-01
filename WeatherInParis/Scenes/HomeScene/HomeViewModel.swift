//
//  HomeViewModel.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 29/02/2024.
//

import SwiftUI
import Combine

final class HomeViewModel: BaseViewModel {

    @Dependency(\.router) var router
    @Published var currentCity: String = LocalizedStrings.paris.localized()
    @Published var dateString: String = Date().formatted(.dateTime.month().day())
    @Published var image: Image = Image(systemName: "exclamationmark.triangle.fill")
    @Published var weatherType: String = "Cloudy"
    @Published var temperatureString: String = "12"
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

    func showDetails() {
        isLoaded = true
        router.push(to: .detailsScreen)
    }

    func refreshData() {
        currentState = .loading
        // state after loading data
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) { [weak self] in
            self?.currentState = .success
        }

    }
}
