//
//  WeatherDetailsRow.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 02/03/2024.
//

import SwiftUI

struct WeatherDetailsRow: View {
    var title: String
    @Binding var description: String

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
