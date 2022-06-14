//
//  CurrentWeatherData.swift
//  Weather
//
//  Created by MacBook Pro on 2022-06-10.
//

import Foundation

struct CurrentWeatherData: Codable {
    let name: String
    let main: Main
    let weather: [WeatherElement]
}

struct Main: Codable {
    let temp, feelsLike: Double
    
    enum CodingKeys: String, CodingKey {
            case temp
            case feelsLike = "feels_like"
    }
}
    
struct WeatherElement: Codable {
    let id: Int
}
