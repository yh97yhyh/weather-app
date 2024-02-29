//
//  CitiesView.swift
//  WeatherMeow
//
//  Created by 영현 on 2/29/24.
//

import SwiftUI

struct CitiesView: View {
    @ObservedObject var cityViewModel: CityViewViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    MenuHeaderView(cityViewModel: cityViewModel)
                        .padding(.bottom)
                    
                    ForEach(0..<5) { index in
                        NavigationLink(destination: CityCardView(cityViewModel: CityViewViewModel())) {
                            CityCardView(cityViewModel: CityViewViewModel())
                                .padding(.bottom, 10)
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
}

#Preview {
    CitiesView(cityViewModel: CityViewViewModel())
}
