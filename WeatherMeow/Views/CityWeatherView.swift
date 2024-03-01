//
//  CityWeatherView.swift
//  WeatherMeow
//
//  Created by 영현 on 2/29/24.
//

import SwiftUI

struct CityWeatherView: View {
    @ObservedObject var citiesViewModel = CitiesViewModel.shared
    @ObservedObject var cityViewModel = CityViewViewModel()
    @Binding var isFromSearch: Bool
    @State private var isFavorite = false
    @Environment(\.dismiss) private var dismiss
    
    init(cityViewModel: CityViewViewModel, isFromSearch: Binding<Bool>) {
        self.cityViewModel = cityViewModel
        self._isFromSearch = isFromSearch
        _isFavorite = State(initialValue: CitiesViewModel.shared.cities.contains(cityViewModel.city))
    }
    
    var body: some View {
        //        NavigationView {
        ZStack {
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    ZStack {
                        if cityViewModel.isLoading {
                            GeometryReader { geometry in
                                ProgressView("")
                                    .progressViewStyle(CircularProgressViewStyle())
                                    .foregroundColor(.white)
                                    .background(Color.clear)
                                    .frame(width: geometry.size.width, height: nil)
                            }
                        } else {
                            CityView(cityViewModel: cityViewModel)
                            HStack {
                                Spacer()
                                VStack {
                                    Button(action: {
                                        isFavorite.toggle()
                                        if isFavorite {
                                            UserDefaultsManager.shared.addFavoriteCity(cityViewModel.city)
                                        } else {
                                            UserDefaultsManager.shared.removeFavoriteCity(cityViewModel.city)
                                        }
                                    }) {
                                        Image(systemName: isFavorite ? "star.fill" : "star")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(.white)
                                            .padding(.horizontal)
                                    }
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
            .padding(.top, 30)
            
            if !isFromSearch {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "list.bullet.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                }
            }
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6050806046, green: 0.8078469634, blue: 0.9820559621, alpha: 1)), Color(#colorLiteral(red: 0.4196078431, green: 0.5333333333, blue: 0.937254902, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
        //        }
        //        .navigationBarHidden(true) // hide the navigation bar if needed
        //        .navigationBarBackButtonHidden(true) // hide back button if needed
    }
}

#Preview {
    CityWeatherView(cityViewModel: CityViewViewModel(), isFromSearch: .constant(false))
}
