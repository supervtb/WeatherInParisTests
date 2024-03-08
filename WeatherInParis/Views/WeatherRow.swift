//
//  WeatherRow.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 01/03/2024.
//

import SwiftUI
import Kingfisher

struct WeatherRow: View {
    private struct Consts {
        static let defaultIconSize: CGFloat = 20
        static let defaultSpacing: CGFloat = 20
    }

    private let image: KFImage
    private let headerText: String
    private let leftValue: String
    private let centerValue: String
    private let rightValue: String

    init(image: KFImage, headerText: String, leftValue: String, centerValue: String, rightValue: String) {
        self.image = image
        self.headerText = headerText
        self.leftValue = leftValue
        self.centerValue = centerValue
        self.rightValue = rightValue
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(headerText)
                .bold()
                .font(.subheadline)
                .foregroundStyle(Color.txtSecondary)
            HStack(spacing: Consts.defaultSpacing) {
                image
                    .placeholder({ _ in
                        ProgressView()
                            .tint(Color.bgPrimary)
                    })
                    .frame(width: Consts.defaultIconSize, height: Consts.defaultIconSize)
                    .padding()
                Text(leftValue)
                    .bold()
                    .foregroundStyle(Color.txtSecondary)
                Text(centerValue)
                    .bold()
                    .foregroundStyle(Color.txtSecondary)
                Text(rightValue)
                    .bold()
                    .foregroundStyle(Color.txtSecondary)
            }
        }
    }
}
