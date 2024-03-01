//
//  HomeViewModel.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 29/02/2024.
//

import SwiftUI

final class HomeViewModel: BaseViewModel {

    override init() {
        super.init()
        setupModelState()
    }

    private func setupModelState() {
        switch currentState {
        case .start:
            print("Model start")
        case .loading:
            print("Model loading")
        case .success:
            print("Model success")
        case .failure:
            print("Model failure")
        }
    }
}
