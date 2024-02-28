//
//  CityNameView.swift
//  WeatherMeow
//
//  Created by 영현 on 2/28/24.
//

import SwiftUI

struct CityNameView: View {
    var city: String
    var date: String
    
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 10) {
                Text(city)
                    .font(.title)
                    .bold()
                Text(date)
            }.foregroundColor(.white)
        }
    }
}

#Preview {
    CityNameView(city: "Seoul", date: "")
}
