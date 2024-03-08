//
//  ContentView.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 28/02/2024.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
    private struct Consts {
        static let defaultImageWidth: CGFloat = 350
        static let minSpacing: CGFloat = 20
        static let cornerRadius: CGFloat = 20
    }

    @StateObject private var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        UIRefreshControl.appearance().tintColor = UIColor.main
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                
                // MARK: Current day view
                WeatherView(
                    currentCity: $viewModel.currentCity.wrappedValue,
                    dateString: $viewModel.dateString.wrappedValue,
                    image: KFImage($viewModel.image.wrappedValue),
                    weatherType: $viewModel.weatherType.wrappedValue,
                    temperatureString: $viewModel.temperatureString.wrappedValue,
                    isLoaded: $viewModel.currentState.wrappedValue != .loading ? true : false
                )
                Image
                    .backgroundImage
                    .frame(width: Consts.defaultImageWidth)
                Spacer(minLength: Consts.minSpacing)

                // MARK: Show error
                if viewModel.currentState == .failure {
                    Text($viewModel.errorMessage.wrappedValue)
                        .foregroundStyle(Color.textPrimary)
                }

                // MARK: Forecasts for next 5 days
                VStack(alignment: .center) {
                    ForEach($viewModel.forecast, id: \.self) { forecast in
                        WeatherRow(
                            image: KFImage(viewModel.prepareImageUrl(from: forecast.weather.first?.icon.wrappedValue ?? "")),
                            headerText: viewModel.formattedDateString(from: forecast.dt.wrappedValue),
                            leftValue: "\(viewModel.doubleSting(from: forecast.main.temp.wrappedValue))°",
                            centerValue: "\(viewModel.doubleSting(from: forecast.main.tempMin.wrappedValue))°",
                            rightValue: "\(viewModel.doubleSting(from: forecast.main.tempMax.wrappedValue))°"
                        )
                        .padding(Consts.minSpacing)
                        .onTapGesture {
                            viewModel.showDetails(forecast: forecast.wrappedValue)
                        }
                    }
                }
                .background(Color.main)
                .clipShape(RoundedRectangle(
                    cornerSize: CGSize(
                        width: Consts.cornerRadius,
                        height: Consts.cornerRadius
                    ), style: .continuous))
                Spacer()
            }
            .padding()
        }
        .refreshable {
            // MARK: Reload data
            viewModel.refreshData()
        }
        .onFirstAppear {
            // MARK: Load data when screen is loaded first time
            viewModel.refreshData()
        }
        .background(Color.bgPrimary)
    }
}

#Preview {
    HomeView(viewModel: ViewModelFactory().buildHomeViewModel())
}
