//
//  DependencyKey.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 29/02/2024.
//

import Foundation

/// Protocol which allows to register dependency keys and values.
public protocol DependencyKey {
    associatedtype Value

    /// Current value which where set for the key.
    static var currentValue: Self.Value { get set }
}

public struct DependencyValues {
    
    /// Singleton
    private static var current = DependencyValues()

    /// Subscript which allows to get and set dependencies by keys.
    ///
    /// - Parameters:
    ///     - key: DependencyKey object which should be registered in the project.
    public static subscript<K>(key: K.Type) -> K.Value where K: DependencyKey {
        get { key.currentValue }
        set { key.currentValue = newValue }
    }

    /// Subscript which allows to get and set dependencies by key path.
    ///
    /// - Parameters:
    ///     - keyPath: path to registered object to get it or update.
    public static subscript<T>(_ keyPath: WritableKeyPath<DependencyValues, T>) -> T {
        get { current[keyPath: keyPath] }
        set { current[keyPath: keyPath] = newValue }
    }
}
