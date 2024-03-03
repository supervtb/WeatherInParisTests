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

    @StateObject var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        UIRefreshControl.appearance().tintColor = UIColor.main
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                
                // MARK: Current day view
                WeatherView(
                    currentCity: $viewModel.currentCity,
                    dateString: $viewModel.dateString,
                    image: .constant(KFImage($viewModel.image.wrappedValue)),
                    weatherType: $viewModel.weatherType,
                    temperatureString: $viewModel.temperatureString,
                    isLoaded: $viewModel.currentState.wrappedValue != .loading ? .constant(true) : .constant(false)
                )
                Image
                    .backgroundImage
                    .frame(width: Consts.defaultImageWidth)
                Spacer(minLength: Consts.minSpacing)
                
                // MARK: Forecasts for next 5 days
                VStack(alignment: .center) {
                    ForEach($viewModel.forecast, id: \.self) {
                        WeatherRow(
                            image: .constant(KFImage(viewModel.prepareImageUrl(
                                from: $0.weather.first?.icon.wrappedValue ?? ""
                            ))),
                            headerText: .constant(viewModel.formattedDateString(from: $0.dt.wrappedValue)),
                            leftValue: .constant("\(viewModel.doubleSting(from: $0.main.temp.wrappedValue))°"),
                            centerValue: .constant("\(viewModel.doubleSting(from: $0.main.tempMin.wrappedValue))°"),
                            rightValue: .constant("\(viewModel.doubleSting(from: $0.main.tempMax.wrappedValue))°")
                        )
                        .padding(Consts.minSpacing)
                        .onTapGesture {
                            viewModel.showDetails()
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
        .scrollBounceBehavior(.basedOnSize, axes: [.vertical])
        .background(Color.bgPrimary)
    }
}

#Preview {
    HomeView(viewModel: ViewModelFactory().buildHomeViewModel())
}
