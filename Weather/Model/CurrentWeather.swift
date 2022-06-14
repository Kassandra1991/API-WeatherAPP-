//
//  File.swift
//  Weather
//
//  Created by MacBook Pro on 2022-06-13.
//

import Foundation

struct CurrentWeather {
    let cityName: String
    let tempetature: Double
    
    var tempetarureString: String {
        return String(format: "%.0f", tempetature) //"\(tempetature.rounded())"
    }
    let feelsLikeTemperature: Double
    
    var feelsLikeTempString: String {
        return String(format: "%.0f", feelsLikeTemperature)
    }
    let conditionCode: Int
    var systemIconNameString: String {
        switch conditionCode {
        case 200...232: return "cloud.bolt.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return "cloud.rain.fill"
        case 600...622: return "cloud.snow.fill"
        case 700...771: return "cloud.fog.fill"
        case 800: return "sun.max.fill"
        case 801...804: return "cloud.sun.fill"
        default: return "cloud.fill"
        }
    }
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        tempetature = currentWeatherData.main.temp
        feelsLikeTemperature = currentWeatherData.main.feelsLike
        conditionCode = currentWeatherData.weather.first!.id
    }
}
