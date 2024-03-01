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

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(Date().formatted(.dateTime.month().day()))")
                .bold()
                .font(.subheadline)
            HStack(spacing: 20) {
                Image(systemName: "logo")
                    .font(.title2)
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.888))
                    .cornerRadius(50)
                VStack(alignment: .leading, spacing: 8) {
                    Text("Min temp")
                        .font(.caption)
                    Text("5")
                        .bold()
                        .font(.title)
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text("Max temp")
                        .font(.caption)
                    Text("5")
                        .bold()
                        .font(.title)
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text("Status")
                        .font(.caption)
                    Text("Cloudy")
                        .bold()
                        .font(.title)
                }
            }
        }
        .fixedSize()
    }
}

#Preview {
    WeatherRow()
}