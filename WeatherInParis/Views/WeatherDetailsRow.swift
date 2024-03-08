//
//  WeatherDetailsRow.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 02/03/2024.
//

import SwiftUI

struct WeatherDetailsRow: View {
    private let title: String
    private let description: String

    init(title: String, description: String) {
        self.title = title
        self.description = description
    }

    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .foregroundStyle(Color.txtSecondary)
            Spacer()
            Text(description)
                .bold()
                .font(.title)
                .foregroundStyle(Color.txtSecondary)
        }
    }
}
