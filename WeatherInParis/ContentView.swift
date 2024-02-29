//
//  ContentView.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 28/02/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(LocalizedStrings.helloWorld.localized())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
