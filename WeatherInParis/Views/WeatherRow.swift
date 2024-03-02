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
        static let defaultSpacing: CGFloat = 8
        static let defaultIconSize: CGFloat = 20
        static let defaultLineLimit: Int = 2
    }

    @Binding var image: KFImage
    @Binding var headerText: String
    @Binding var leftTitle: String
    @Binding var centerTitle: String
    @Binding var rightTitle: String
    @Binding var leftValue: String
    @Binding var centerValue: String
    @Binding var rightValue: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(headerText)
                .bold()
                .font(.subheadline)
                .foregroundStyle(Color.txtSecondary)
            HStack(spacing: 20) {
                image
                    .placeholder({ _ in
                        ProgressView()
                            .tint(Color.bgPrimary)
                    })
                    .font(.title2)
                    .frame(width: Consts.defaultIconSize, height: Consts.defaultIconSize)
                    .padding()
                VStack(alignment: .leading, spacing: Consts.defaultSpacing) {
                    Text(leftTitle)
                        .font(.caption)
                        .foregroundStyle(Color.txtSecondary)
                    Spacer()
                    Text(leftValue)
                        .bold()
                        .font(.title)
                        .foregroundStyle(Color.txtSecondary)
                    Spacer()
                }
                VStack(alignment: .leading, spacing: Consts.defaultSpacing) {
                    Text(centerTitle)
                        .font(.caption)
                        .foregroundStyle(Color.txtSecondary)
                    Spacer()
                    Text(centerValue)
                        .bold()
                        .font(.title)
                        .foregroundStyle(Color.txtSecondary)
                    Spacer()
                }
                VStack(alignment: .leading, spacing: Consts.defaultSpacing) {
                    Text(rightTitle)
                        .font(.caption)
                        .foregroundStyle(Color.txtSecondary)
                    Spacer()
                    Text(rightValue)
                        .lineLimit(Consts.defaultLineLimit)
                        .bold()
                        .foregroundStyle(Color.txtSecondary)
                        .font(.title)
                    Spacer()
                }
            }
        }
    }
}
