//
//  Router.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 29/02/2024.
//

import SwiftUI

public class Router<T: Hashable>: RouterProtocol {

    @Published public var root: T
    @Published public var paths: [T] = []

    public init(root: T) {
        self.root = root
    }

    public func updateRoot(with root: T) {
        self.root = root
    }

    public func push(to path: T) {
        paths.append(path)
    }

    public func pop() {
        if !paths.isEmpty {
            paths.removeLast()
        }
    }

    public func popToRoot() {
        paths = []
    }
}
