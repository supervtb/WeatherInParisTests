//
//  BaseViewModel.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 29/02/2024.
//

import Foundation

/// BaseViewModel class provides view state logic to ViewModel.
/// BaseViewModel class provides view state logic to ViewModel.
open class BaseViewModel {

    /// Different states of the View.
    public enum ViewState {
        /// Default state, on the first appear of the View.
        case start

        /// State to show some background actions.
        case loading

        /// State which shows succeed result of loading process.
        case success

        /// State which shows succeed failure of loading process.
        case failure
    }

    /// Current state on the view
    @Published public var currentState: ViewState = .start

    /**
        Default initializer.
     */
    public init() {}
}
