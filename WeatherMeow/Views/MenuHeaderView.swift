//
//  MenuHeaderView.swift
//  WeatherMeow
//
//  Created by 영현 on 2/28/24.
//

import SwiftUI

struct MenuHeaderView: View {
    @ObservedObject var citiesViewModel = CitiesViewModel.shared
    @State private var searchTerm = ""
    @State private var isCityWeatherViewActive = false
    
    var body: some View {
        HStack {
            TextField("", text: $searchTerm)
                .font(.title3)
                .bold()
                .padding(.leading, 20)
            
            Button(action: {
                isCityWeatherViewActive = true
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                    Image(systemName: "location.fill")
                }
            }
            .frame(width: 50, height: 50)
        }
        .foregroundColor(.white)
        .padding()
        .background(ZStack(alignment: .leading) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                .padding(.leading, 10)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue.opacity(0.5))
        })
        .sheet(isPresented: $isCityWeatherViewActive) {
            CityWeatherView(cityViewModel: CityViewViewModel(city: searchTerm), isFromSearch: .constant(true))
        }
    }
}

#Preview {
    MenuHeaderView()
}
