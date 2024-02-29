//
//  RouterProtocol.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 29/02/2024.
//

import SwiftUI

/// RouterProtocol provides router logic
public protocol RouterProtocol<T>: ObservableObject {
    /**
        Associated type T expects Hashable type.
        Expected implementation is to create an enum with all screens in the app.
     */
    associatedtype T = Hashable

    /// Root view
    var root: T { get set }

    /// Array which contains paths to each screen which would be shown during flow.
    var paths: [T] { get set }

    /// Updates root view.
    ///
    /// - Parameters:
    ///     - root: The T type variable, which should be set up as root view.
    func updateRoot(with root: T)

    /// Push to next screen.
    ///
    /// - Parameters:
    ///     - path: The T type variable, which shows the next screen.
    func push(to path: T)

    /// Pop screen.
    func pop()

    /// Pop flow to root screen.
    func popToRoot()
}
