//
//  WeatherView.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 29/02/2024.
//

import SwiftUI

struct WeatherView: View {
    private struct Consts {
        static let defaultSpacing: CGFloat = 6
        static let defaultHeight: CGFloat = 200
        static let defaultIconSpacing: CGFloat = 20
        static let defaultTextSize: CGFloat = 100
    }

    var body: some View {
        VStack(alignment: .leading, spacing: Consts.defaultSpacing) {
            Text("\(LocalizedStrings.today.localized()), \(Date().formatted(.dateTime.month().day().hour().minute()))")
                .fontWeight(.light)
                .foregroundColor(.main)
            VStack {
                HStack(spacing: Consts.defaultSpacing) {
                    VStack(spacing: Consts.defaultIconSpacing) {
                        Image(systemName: "cloud")
                            .font(.system(size: 40))
                            .foregroundColor(.main)
                        Text("Cloud")
                            .foregroundColor(.main)
                            .scaledToFit()
                    }
                    .frame(alignment: .leading)
                    Text("12" + "°")
                        .lineLimit(1)
                        .font(.system(size: Consts.defaultTextSize))
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.main)
                        .layoutPriority(1)
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

#Preview {
    WeatherView()
}
