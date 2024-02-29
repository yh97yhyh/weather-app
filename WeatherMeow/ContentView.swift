//
//  ContentView.swift
//  WeatherMeow
//
//  Created by 영현 on 2/28/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var cityViewModel = CityViewViewModel()
    
    var body: some View {
        VStack {
            CityWeatherView(cityViewModel: cityViewModel, isFromSearch: .constant(false))
        }
//        ZStack {
//            VStack(spacing: 0) {
//                ScrollView(showsIndicators: false) {
//                    MenuHeaderView(cityViewModel: cityViewModel)
//                        .padding(.bottom)
//                    CityView(cityViewModel: cityViewModel)
//                }
//            }
//            .padding(.top, 30)
//            
//            VStack {
//                Spacer()
//                HStack {
//                    Spacer()
//                    Button(action: {
//                        // action
//                    }) {
//                        Image(systemName: "list.bullet.circle.fill")
//                            .resizable()
//                            .frame(width: 40, height: 40)
//                            .foregroundColor(.white)
//                            .padding()
//                    }
//                }
//            }
//        }
//        .background(
//            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6050806046, green: 0.8078469634, blue: 0.9820559621, alpha: 1)), Color(#colorLiteral(red: 0.4196078431, green: 0.5333333333, blue: 0.937254902, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

#Preview {
    ContentView()
}
