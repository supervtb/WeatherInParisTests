//
//  WeatherRow.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 01/03/2024.
//

import SwiftUI

struct WeatherRow: View {
    private struct Consts {

    }

    @Binding var image: Image
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
                    .font(.title2)
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.888))
                    .cornerRadius(50)
                VStack(alignment: .leading, spacing: 8) {
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
                VStack(alignment: .leading, spacing: 8) {
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
                VStack(alignment: .leading, spacing: 8) {
                    Text(rightTitle)
                        .font(.caption)
                        .foregroundStyle(Color.txtSecondary)
                    Spacer()
                    Text(rightValue)
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        .bold()
                        .foregroundStyle(Color.txtSecondary)
                        .font(.title)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    WeatherRow(
        image: .constant(Image(systemName: "logo")),
        headerText: .constant("Mart 1"),
        leftTitle: .constant("Min temp"),
        centerTitle: .constant("Max temp"),
        rightTitle: .constant("Status"),
        leftValue: .constant("5"),
        centerValue: .constant("6"),
        rightValue: .constant("Cloudy")
    )
}
