//
//  DetailsView.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 29/02/2024.
//
import SwiftUI

struct DetailsView: View {
    @Dependency(\.router) var router
    @ObservedObject var viewModel: DetailsViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                WeatherView(
                    currentCity: $viewModel.currentCity,
                    dateString: $viewModel.dateString,
                    image: $viewModel.image,
                    weatherType: $viewModel.weatherType,
                    temperatureString: $viewModel.temperatureString,
                    isLoaded: $viewModel.isLoaded
                )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()

        }
        .scrollBounceBehavior(.basedOnSize, axes: [.vertical])
        .background(Color.bgPrimary)
    }
}

#Preview {
    DetailsView(viewModel: ViewModelFactory().buildDetailsViewModel())
}
