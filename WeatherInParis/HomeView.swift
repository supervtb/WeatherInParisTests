//
//  ContentView.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 28/02/2024.
//

import SwiftUI

struct HomeView: View {
    @Dependency(\.router) var router

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(LocalizedStrings.weather.localized())
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
