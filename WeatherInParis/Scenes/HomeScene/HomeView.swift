//
//  ContentView.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 28/02/2024.
//

import SwiftUI

struct HomeView: View {
    private struct Consts {
        static let defaultImageWidth: CGFloat = 350
        static let minSpacing: CGFloat = 20
        static let cornerRadius: CGFloat = 20
    }

    @ObservedObject var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        UIRefreshControl.appearance().tintColor = UIColor.main
    }

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
                Image
                    .backgroundImage
                    .frame(width: Consts.defaultImageWidth)
                Spacer(minLength: Consts.minSpacing)
                VStack(alignment: .center) {
                    // TODO: Add rows for weather next n days
                    ForEach((0..<5)) { _ in
                        WeatherRow(
                            image: .constant(Image(systemName: "logo")),
                            headerText: .constant("Mar, 1"),
                            leftTitle: .constant("Min temp"),
                            centerTitle: .constant("Max temp"),
                            rightTitle: .constant("Status"),
                            leftValue: .constant("5"),
                            centerValue: .constant("6"),
                            rightValue: .constant("Cloudy")
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
