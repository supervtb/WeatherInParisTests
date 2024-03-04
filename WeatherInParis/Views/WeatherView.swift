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

    @Binding var currentCity: String
    @Binding var dateString: String
    @Binding var image: KFImage
    @Binding var weatherType: String
    @Binding var temperatureString: String
    @Binding var isLoaded: Bool

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

#Preview {
    WeatherView(
        currentCity: .constant("Paris"),
        dateString: .constant("12.12.12"),
        image: .constant(KFImage(URL(string: "https://openweathermap.org/img/wn/10n@2x.png"))),
        weatherType: .constant("cloudy"),
        temperatureString: .constant("12"),
        isLoaded: .constant(true)
    )
    .background(.red)
}
