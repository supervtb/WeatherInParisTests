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
                    currentCity: $viewModel.currentCity,
                    dateString: $viewModel.dateString,
                    image: .constant(KFImage($viewModel.image.wrappedValue)),
                    weatherType: $viewModel.weatherType,
                    temperatureString: $viewModel.temperatureString,
                    isLoaded: $viewModel.isLoaded
                )
                VStack(spacing: Consts.minSpacing) {
                    WeatherDetailsRow(title: LocalizedStrings.tempMin.localized(), description: $viewModel.tempMin)
                    WeatherDetailsRow(title: LocalizedStrings.tempMax.localized(), description: $viewModel.tempMax)
                    WeatherDetailsRow(title: LocalizedStrings.feelsLike.localized(), description: $viewModel.feelsLike)
                    WeatherDetailsRow(title: LocalizedStrings.pressure.localized(), description: $viewModel.pressure)
                    WeatherDetailsRow(title: LocalizedStrings.humidity.localized(), description: $viewModel.humidity)
                    WeatherDetailsRow(title: LocalizedStrings.windSpeed.localized(), description: $viewModel.windSpeed)
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
