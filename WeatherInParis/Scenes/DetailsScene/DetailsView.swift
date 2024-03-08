//
//  DetailsView.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 29/02/2024.
//
import SwiftUI
import Kingfisher

struct DetailsView: View {
    private struct Consts {
        static let minSpacing: CGFloat = 20
        static let cornerRadius: CGFloat = 20
    }

    @StateObject var viewModel: DetailsViewModel

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                WeatherView(
                    currentCity: $viewModel.currentCity.wrappedValue,
                    dateString: $viewModel.dateString.wrappedValue,
                    image: KFImage($viewModel.image.wrappedValue),
                    weatherType: $viewModel.weatherType.wrappedValue,
                    temperatureString: $viewModel.temperatureString.wrappedValue,
                    isLoaded: $viewModel.isLoaded.wrappedValue
                )
                VStack(spacing: Consts.minSpacing) {
                    WeatherDetailsRow(title: LocalizedStrings.tempMin.localized(), description: $viewModel.tempMin.wrappedValue)
                    WeatherDetailsRow(title: LocalizedStrings.tempMax.localized(), description: $viewModel.tempMax.wrappedValue)
                    WeatherDetailsRow(title: LocalizedStrings.feelsLike.localized(), description: $viewModel.feelsLike.wrappedValue)
                    WeatherDetailsRow(title: LocalizedStrings.pressure.localized(), description: $viewModel.pressure.wrappedValue)
                    WeatherDetailsRow(title: LocalizedStrings.humidity.localized(), description: $viewModel.humidity.wrappedValue)
                    WeatherDetailsRow(title: LocalizedStrings.windSpeed.localized(), description: $viewModel.windSpeed.wrappedValue)
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.main)
                .clipShape(RoundedRectangle(
                    cornerSize: CGSize(
                        width: Consts.cornerRadius,
                        height: Consts.cornerRadius
                    ), style: .continuous))
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .scrollBounceBehavior(.basedOnSize, axes: [.vertical])
        .background(Color.bgPrimary)
    }
}
