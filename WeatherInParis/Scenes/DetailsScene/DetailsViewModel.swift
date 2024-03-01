//
//  DetailsViewModel.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 29/02/2024.
//

import SwiftUI

final class DetailsViewModel: BaseViewModel {

    override init() {
        super.init()
        setupModelState()
    }

    private func setupModelState() {
        switch currentState {
        case .start:
            print("Details Model start")
        case .loading:
            print("Details Model loading")
        case .success:
            print("Details Model success")
        case .failure:
            print("Details Model failure")
        }
    }
}
