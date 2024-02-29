//
//  DependencyWrapper.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 29/02/2024.
//

import Foundation

/// Dependency wrapper
@propertyWrapper public struct Dependency<T> {
    /// Dictionary with keys.
    private let keyPath: WritableKeyPath<DependencyValues, T>

    /// Wrapped value of the object registered in DependencyValues.
    public var wrappedValue: T {
        get { DependencyValues[keyPath] }
        set { DependencyValues[keyPath] = newValue }
    }

    /**
     Initializes a new dependency via keyPath.

          - Parameters:
             - keyPath: path to registered object to get it or update, works as dictionary.

          - Returns: dependency.
     */
    public init(_ keyPath: WritableKeyPath<DependencyValues, T>) {
        self.keyPath = keyPath
    }
}
