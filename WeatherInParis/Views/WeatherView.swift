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
        static let imageSize: CGFloat = 40
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
            Text("\(dateString)")
                .fontWeight(.light)
                .foregroundColor(.main)
            VStack {
                HStack(spacing: Consts.defaultSpacing) {
                    VStack(spacing: Consts.defaultIconSpacing) {
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
                            .scaledToFit()
                    }
                    .frame(alignment: .leading)
                    Spacer()
                    Text(temperatureString)
                        .lineLimit(1)
                        .font(.system(size: Consts.defaultTextSize))
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.main)
                        .layoutPriority(1)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
