//
//  WeatherView.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 29/02/2024.
//

import SwiftUI
import Kingfisher

struct WeatherView: View {
    private struct Consts {
        static let defaultSpacing: CGFloat = 6
        static let defaultHeight: CGFloat = 200
        static let defaultIconSpacing: CGFloat = 20
        static let defaultTextSize: CGFloat = 100
        static let titleSize: CGFloat = 50
        static let imageSize: CGFloat = 100
    }

    private let currentCity: String
    private let dateString: String
    private let image: KFImage
    private let weatherType: String
    private let temperatureString: String
    private let isLoaded: Bool

    init(
        currentCity: String,
        dateString: String,
        image: KFImage,
        weatherType: String,
        temperatureString: String,
        isLoaded: Bool
    ) {
        self.currentCity = currentCity
        self.dateString = dateString
        self.image = image
        self.weatherType = weatherType
        self.temperatureString = temperatureString
        self.isLoaded = isLoaded
    }

    var body: some View {
        VStack(alignment: .leading, spacing: Consts.defaultSpacing) {
            Text(currentCity)
                .font(.system(size: Consts.titleSize))
                .lineLimit(1)
                .fontWeight(.bold)
                .foregroundColor(.main)
                .multilineTextAlignment(.leading)
            Text(dateString)
                .fontWeight(.light)
                .foregroundColor(.main)
            HStack(alignment: .center, spacing: Consts.defaultSpacing) {
                VStack(alignment: .center) {
                    if isLoaded {
                        image
                            .frame(width: Consts.imageSize, height: Consts.imageSize)
                            .foregroundColor(.main)
                    } else {
                        ProgressView()
                            .fixedSize()
                            .tint(Color.main)
                    }
                    Text(weatherType)
                        .foregroundColor(.main)
                }
                Spacer()
                Text(temperatureString)
                    .lineLimit(1)
                    .font(.system(size: Consts.defaultTextSize))
                    .fontWeight(.bold)
                    .foregroundColor(.main)
                    .layoutPriority(1)
            }
        }
        .frame(maxWidth: .infinity)
    }
}
