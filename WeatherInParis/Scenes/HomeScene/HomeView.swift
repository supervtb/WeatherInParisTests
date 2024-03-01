//
//  ContentView.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 28/02/2024.
//

import SwiftUI

struct HomeView: View {
    @Dependency(\.router) var router
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        ZStack {
            Color.bgPrimary.ignoresSafeArea()
            VStack {
                WeatherView()
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        }
    }
}

#Preview {
    HomeView(viewModel: ViewModelFactory().buildHomeViewModel())
}
