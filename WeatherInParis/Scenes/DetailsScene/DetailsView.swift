//
//  DetailsView.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 29/02/2024.
//
import SwiftUI

struct DetailsView: View {
    @Dependency(\.router) var router
    @ObservedObject var viewModel: DetailsViewModel

    var body: some View {
        VStack {
            Text("details")
        }
        .padding()
    }
}

#Preview {
    DetailsView(viewModel: ViewModelFactory().buildDetailsViewModel())
}
