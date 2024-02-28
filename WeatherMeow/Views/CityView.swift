//
//  CityView.swift
//  WeatherMeow
//
//  Created by 영현 on 2/29/24.
//

import SwiftUI

struct CityView: View {
    @ObservedObject var cityViewModel: CityViewViewModel
    
    var body: some View {
        VStack {
            CityNameView(city: cityViewModel.city, date: cityViewModel.date)
                .shadow(radius: 0)
            TodayWeatherView(cityViewModel: cityViewModel)
                .padding()
            HourlyWeatherView(cityViewModel: cityViewModel)
                .padding()
            DailyWeatherView(cityViewModel: cityViewModel)
                .padding(.horizontal)
        }
        .padding(.bottom, 30)
    }
}

#Preview {
    CityView(cityViewModel: CityViewViewModel())
}
