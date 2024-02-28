//
//  Util.swift
//  WeatherMeow
//
//  Created by 영현 on 2/29/24.
//

import Foundation

func toMeterPerSecond(_ mph: Double) -> Double {
    let conversionFactor = 1609.344 / 3600
    return mph * conversionFactor
}

func toCelsius(_ fahrenheit: Double) -> Double {
    return (fahrenheit - 32) * 5/9
}
