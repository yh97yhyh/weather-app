//
//  CitiesView.swift
//  WeatherMeow
//
//  Created by 영현 on 2/29/24.
//

import SwiftUI

struct CitiesView: View {
    @ObservedObject var citiesViewModel = CitiesViewModel.shared
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    ScrollView(showsIndicators: false) {
                        MenuHeaderView()
                            .padding(.bottom)
                        ForEach(citiesViewModel.cities, id: \.self) { city in
                            NavigationLink(
                                destination: CityWeatherView(cityViewModel: CityViewViewModel(city: city), isFromSearch: .constant(false))
                                    .navigationBarBackButtonHidden(true)) {
                                        CityCardView(cityViewModel: CityViewViewModel(city: city))
                                            .padding(.bottom, 5)
                                    }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 30)
                
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6050806046, green: 0.8078469634, blue: 0.9820559621, alpha: 1)), Color(#colorLiteral(red: 0.4196078431, green: 0.5333333333, blue: 0.937254902, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
        }
        .navigationBarHidden(true) // hide the navigation bar if needed
        .navigationBarBackButtonHidden(true) // hide back button if needed
    }
}

#Preview {
    CitiesView(citiesViewModel: CitiesViewModel())
}
