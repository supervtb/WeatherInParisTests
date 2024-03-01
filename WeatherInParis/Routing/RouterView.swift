//
//  RouterView.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 29/02/2024.
//

import SwiftUI

/// RouterView is a wrapper to the views which suppoused to be handled via Router
public struct RouterView<T: Hashable, Content: View>: View {

    /// Main router which controll application flow.
    @ObservedObject public var router: Router<T>

    /// Closure which as result has final view, which should be shown.
    @ViewBuilder public var buildView: (T) -> Content

    /// RouterView's body which wrapps buildView result with NavigationStack.
    public var body: some View {
        NavigationStack(path: $router.paths) {
            buildView(router.root)
            .navigationDestination(for: T.self) { path in
                buildView(path)
            }
        }
        .tint(Color.main)
        .environmentObject(router)
    }

    /// Initializes a new router view with with the provided router and view.
    ///
    /// - Parameters:
    ///     - router: The main app router.
    ///     - buildView: The closure which creates root view on start.
    /// - Returns: Router view, which must be used as base view of the app.
    public init(router: Router<T>, buildView: @escaping (T) -> Content) {
        self.router = router
        self.buildView = buildView
    }
}
