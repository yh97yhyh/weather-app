//
//  API+Extensions.swift
//  WeatherMeow
//
//  Created by 영현 on 2/28/24.
//

import Foundation

extension API {
    static let baseUrlString = "https://api.openweathermap.org/data/3.0/"
    
    static func getUrlFor(lat: Double, lon: Double) -> String {
        return "\(baseUrlString)onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(key)&units=imperial"
        
    }
}
