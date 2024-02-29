//
//  CityWeatherView.swift
//  WeatherMeow
//
//  Created by 영현 on 2/29/24.
//

import SwiftUI

struct CityWeatherView: View {
    @ObservedObject var cityViewModel = CityViewViewModel()
    @Binding var isFromSearch: Bool
    @State private var navigationToCitiesView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    ScrollView(showsIndicators: false) {
                        CityView(cityViewModel: cityViewModel)
                    }
                }
                .padding(.top, 30)
                
                if !isFromSearch {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            NavigationLink(
                                destination: CitiesView( cityViewModel: cityViewModel)
                                    .navigationBarBackButtonHidden(true),
                                isActive: $navigationToCitiesView,
                                label: {
                                    Image(systemName: "list.bullet.circle.fill")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(.white)
                                        .padding()
                                })
                                .isDetailLink(false) // to avoid default navigation behavior
                        }
                    }
                }
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6050806046, green: 0.8078469634, blue: 0.9820559621, alpha: 1)), Color(#colorLiteral(red: 0.4196078431, green: 0.5333333333, blue: 0.937254902, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
        }
        .navigationBarHidden(true) // hide the navigation bar if needed
        .navigationBarBackButtonHidden(true) // hide back button if needed
    }
}

#Preview {
    CityWeatherView(cityViewModel: CityViewViewModel(), isFromSearch: .constant(false))
}
