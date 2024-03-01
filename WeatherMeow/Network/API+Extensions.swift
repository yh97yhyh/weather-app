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
        let apiKey = (Bundle.main.apiKey != nil) ? Bundle.main.apiKey! : ""
        return "\(baseUrlString)onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(key)&units=imperial"
        
    }
}
extension Bundle {
    var apiKey: String? {
        return infoDictionary?["API_KEY"] as? String
    }
}
